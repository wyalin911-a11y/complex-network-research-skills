#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLS_ROOT="${RESEARCH_TOOLS_ROOT:-$HOME/.local/share/research-tools}"

RESEARCHSTUDIO_REPO="${RESEARCHSTUDIO_REPO:-$TOOLS_ROOT/ResearchStudio}"
ARIS_REPO="${ARIS_REPO:-$TOOLS_ROOT/ARIS}"
CUSTOM_SKILLS_REPO="${CUSTOM_SKILLS_REPO:-$SCRIPT_DIR}"

CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$CODEX_HOME_DIR/skills}"

ARIS_PROJECTS_FILE="${ARIS_PROJECTS_FILE:-$SCRIPT_DIR/config/aris_projects.txt}"
ARIS_NEW_POLICY="--skip-new"
EXTRA_PROJECTS=""

usage() {
  cat <<'EOF'
Usage:
  bash update_all.sh [options]

Options:
  --project PATH       Reconcile ARIS skills for one additional project.
                       May be passed multiple times.
  --aris-add-new       During ARIS reconcile, accept newly added upstream skills.
                       Default is --skip-new.
  --help               Show this help.

Environment overrides:
  RESEARCH_TOOLS_ROOT
  RESEARCHSTUDIO_REPO
  ARIS_REPO
  CUSTOM_SKILLS_REPO
  CODEX_HOME
  CODEX_SKILLS_DIR
  ARIS_PROJECTS_FILE
EOF
}

PROJECT_ARGS_FILE="$(mktemp -t research-skill-projects.XXXXXX)"
trap 'rm -f "$PROJECT_ARGS_FILE"' EXIT

while [ $# -gt 0 ]; do
  case "$1" in
    --project)
      [ $# -ge 2 ] || { echo "--project requires a path" >&2; exit 2; }
      printf '%s\n' "$2" >> "$PROJECT_ARGS_FILE"
      shift 2
      ;;
    --aris-add-new)
      ARIS_NEW_POLICY="--add-new"
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

pull_repo() {
  label="$1"
  path="$2"

  echo
  echo "== $label =="
  if [ ! -d "$path" ]; then
    echo "SKIP: not found: $path"
    return 1
  fi

  if [ -d "$path/.git" ]; then
    git -C "$path" pull --ff-only
  else
    echo "NOTE: $path is not a Git worktree; no git pull performed."
  fi
  return 0
}

# 1) Update this custom suite.
pull_repo "Custom complex-network skills" "$CUSTOM_SKILLS_REPO" || true

# Always refresh the custom symlinks, even when the suite is not a Git clone.
if [ -x "$SCRIPT_DIR/install_custom_symlinks.sh" ]; then
  CODEX_SKILLS_DIR="$CODEX_SKILLS_DIR" bash "$SCRIPT_DIR/install_custom_symlinks.sh"
fi

# 2) Update Microsoft ResearchStudio and re-run its idempotent installer.
if pull_repo "Microsoft ResearchStudio" "$RESEARCHSTUDIO_REPO"; then
  if [ -f "$RESEARCHSTUDIO_REPO/install.sh" ]; then
    echo "Refreshing ResearchStudio Idea skill links..."
    CODEX_SKILLS_DIR="$CODEX_SKILLS_DIR" \
      bash "$RESEARCHSTUDIO_REPO/install.sh" \
      --idea --no-reel --codex --no-claude
  else
    echo "WARN: install.sh not found in ResearchStudio repo." >&2
  fi
fi

# 3) Update ARIS.
ARIS_READY=false
if pull_repo "ARIS" "$ARIS_REPO"; then
  if [ -f "$ARIS_REPO/tools/install_aris_codex.sh" ]; then
    ARIS_READY=true
  else
    echo "WARN: ARIS installer not found." >&2
  fi
fi

# 4) Reconcile ARIS in registered projects.
if [ "$ARIS_READY" = true ]; then
  PROJECT_LIST_FILE="$(mktemp -t research-skill-project-list.XXXXXX)"
  trap 'rm -f "$PROJECT_ARGS_FILE" "$PROJECT_LIST_FILE"' EXIT

  if [ -f "$ARIS_PROJECTS_FILE" ]; then
    awk 'NF && $1 !~ /^#/' "$ARIS_PROJECTS_FILE" >> "$PROJECT_LIST_FILE"
  fi
  cat "$PROJECT_ARGS_FILE" >> "$PROJECT_LIST_FILE"

  if [ -s "$PROJECT_LIST_FILE" ]; then
    # Deduplicate while preserving one path per line.
    awk '!seen[$0]++' "$PROJECT_LIST_FILE" | while IFS= read -r project; do
      [ -n "$project" ] || continue
      echo
      echo "== ARIS project: $project =="

      if [ ! -d "$project" ]; then
        echo "SKIP: project not found."
        continue
      fi

      manifest="$project/.aris/installed-skills-codex.txt"
      if [ ! -f "$manifest" ]; then
        echo "SKIP: ARIS manifest not found."
        echo "Initial install must be run once with ARIS's installer:"
        echo "  bash \"$ARIS_REPO/tools/install_aris_codex.sh\" \"$project\""
        continue
      fi

      bash "$ARIS_REPO/tools/install_aris_codex.sh" \
        "$project" --reconcile "$ARIS_NEW_POLICY"
    done
  else
    echo
    echo "No ARIS projects registered."
    echo "Add absolute project paths to:"
    echo "  $ARIS_PROJECTS_FILE"
  fi
fi

echo
echo "All available research-skill sources have been updated."
echo "If Codex was open during structural skill changes, restart it."
