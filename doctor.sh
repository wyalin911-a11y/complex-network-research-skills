#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLS_ROOT="${RESEARCH_TOOLS_ROOT:-$HOME/.local/share/research-tools}"
RESEARCHSTUDIO_REPO="${RESEARCHSTUDIO_REPO:-$TOOLS_ROOT/ResearchStudio}"
ARIS_REPO="${ARIS_REPO:-$TOOLS_ROOT/ARIS}"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$CODEX_HOME_DIR/skills}"

echo "Research Skill Doctor"
echo "====================="
echo
echo "Codex skills dir: $CODEX_SKILLS_DIR"

for skill in complex-network-research-taste complex-network-idea-pipeline idea-spark paper-search scoop-check; do
  path="$CODEX_SKILLS_DIR/$skill"
  if [ -L "$path" ]; then
    echo "OK   $skill -> $(readlink "$path")"
  elif [ -e "$path" ]; then
    echo "COPY $skill exists but is not a symlink: $path"
  else
    echo "MISS $skill"
  fi
done

echo
for item in "ResearchStudio:$RESEARCHSTUDIO_REPO" "ARIS:$ARIS_REPO" "CustomSuite:$SCRIPT_DIR"; do
  label="${item%%:*}"
  path="${item#*:}"
  if [ -d "$path/.git" ]; then
    branch="$(git -C "$path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo '?')"
    sha="$(git -C "$path" rev-parse --short HEAD 2>/dev/null || echo '?')"
    dirty="$(git -C "$path" status --porcelain 2>/dev/null | head -n 1)"
    if [ -n "$dirty" ]; then state="dirty"; else state="clean"; fi
    echo "GIT  $label: $path [$branch $sha, $state]"
  elif [ -d "$path" ]; then
    echo "DIR  $label: $path (not a Git worktree)"
  else
    echo "MISS $label: $path"
  fi
done
