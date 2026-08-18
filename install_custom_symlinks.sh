#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"

mkdir -p "$DEST"

link_one() {
  name="$1"
  src="$SCRIPT_DIR/$name"
  dst="$DEST/$name"

  [ -d "$src" ] || { echo "Missing skill directory: $src" >&2; exit 1; }

  if [ -L "$dst" ]; then
    current="$(readlink "$dst")"
    if [ "$current" = "$src" ]; then
      echo "OK: $dst -> $src"
      return
    fi
    rm "$dst"
  elif [ -e "$dst" ]; then
    backup="${dst}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "Backed up existing path: $dst -> $backup"
  fi

  ln -s "$src" "$dst"
  echo "Linked: $dst -> $src"
}

link_one "complex-network-research-taste"
link_one "complex-network-idea-pipeline"

echo
echo "Custom skills are now symlinked."
echo "Restart Codex if it is already running."
