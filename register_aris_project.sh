#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CFG="${ARIS_PROJECTS_FILE:-$SCRIPT_DIR/config/aris_projects.txt}"

[ $# -eq 1 ] || {
  echo "Usage: bash register_aris_project.sh /absolute/path/to/project" >&2
  exit 2
}

project="$1"

case "$project" in
  /*) ;;
  *)
    echo "Please provide an absolute path." >&2
    exit 2
    ;;
esac

mkdir -p "$(dirname "$CFG")"
touch "$CFG"

if grep -Fqx "$project" "$CFG"; then
  echo "Already registered: $project"
else
  printf '%s\n' "$project" >> "$CFG"
  echo "Registered: $project"
fi

echo "Config: $CFG"
