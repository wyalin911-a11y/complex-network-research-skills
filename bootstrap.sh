#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLS_ROOT="${RESEARCH_TOOLS_ROOT:-$HOME/.local/share/research-tools}"
RESEARCHSTUDIO_REPO="${RESEARCHSTUDIO_REPO:-$TOOLS_ROOT/ResearchStudio}"
ARIS_REPO="${ARIS_REPO:-$TOOLS_ROOT/ARIS}"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$CODEX_HOME_DIR/skills}"

PROJECT=""

usage() {
  cat <<'EOF'
Usage:
  bash bootstrap.sh [--project /absolute/path/to/research-project]

What it does:
  1. Installs the two custom skills as symlinks.
  2. Clones Microsoft ResearchStudio if missing.
  3. Installs ResearchStudio-Idea for Codex.
  4. Clones ARIS if missing.
  5. If --project is supplied, runs ARIS's own initial project installer
     and registers that project for future update_all.sh reconciles.
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --project)
      [ $# -ge 2 ] || { echo "--project requires a path" >&2; exit 2; }
      PROJECT="$2"
      shift 2
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

mkdir -p "$TOOLS_ROOT" "$CODEX_SKILLS_DIR"

echo "== Custom complex-network skills =="
CODEX_SKILLS_DIR="$CODEX_SKILLS_DIR" bash "$SCRIPT_DIR/install_custom_symlinks.sh"

echo
echo "== Microsoft ResearchStudio =="
if [ ! -d "$RESEARCHSTUDIO_REPO/.git" ]; then
  git clone https://github.com/microsoft/ResearchStudio.git "$RESEARCHSTUDIO_REPO"
else
  echo "Already cloned: $RESEARCHSTUDIO_REPO"
fi

CODEX_SKILLS_DIR="$CODEX_SKILLS_DIR" \
  bash "$RESEARCHSTUDIO_REPO/install.sh" \
  --idea --no-reel --codex --no-claude

echo
echo "== ARIS =="
if [ ! -d "$ARIS_REPO/.git" ]; then
  git clone https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep.git "$ARIS_REPO"
else
  echo "Already cloned: $ARIS_REPO"
fi

if [ -n "$PROJECT" ]; then
  mkdir -p "$PROJECT"
  echo
  echo "== Initial ARIS install for project =="
  echo "$PROJECT"
  bash "$ARIS_REPO/tools/install_aris_codex.sh" "$PROJECT"

  manifest="$PROJECT/.aris/installed-skills-codex.txt"
  if [ -f "$manifest" ]; then
    cfg="$SCRIPT_DIR/config/aris_projects.txt"
    touch "$cfg"
    if ! grep -Fqx "$PROJECT" "$cfg"; then
      printf '%s\n' "$PROJECT" >> "$cfg"
      echo "Registered for future updates: $PROJECT"
    fi
  else
    echo "NOTE: ARIS manifest was not created; project was not auto-registered."
  fi
else
  echo
  echo "ARIS cloned, but no project was specified."
  echo "Later run:"
  echo "  bash bootstrap.sh --project /absolute/path/to/project"
  echo "or use ARIS's installer directly."
fi

echo
echo "Bootstrap complete."
echo "Restart Codex before first use."
