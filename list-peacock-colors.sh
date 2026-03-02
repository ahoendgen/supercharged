#!/bin/bash
# List all Peacock colors in use across projects.
# Helps avoid color collisions when setting up new repos.

SEARCH_DIR="${1:-/Users/andre/projects}"

echo "Peacock colors in: $SEARCH_DIR"
echo ""

find "$SEARCH_DIR" \
  -name node_modules -prune -o \
  -name .git -prune -o \
  -name dist -prune -o \
  -name build -prune -o \
  -name settings.json -path '*/.vscode/settings.json' -print \
  2>/dev/null | while read -r f; do
  color=$(jq -r '.["peacock.color"] // empty' "$f" 2>/dev/null)
  if [ -n "$color" ]; then
    project=$(echo "$f" | sed "s|$SEARCH_DIR/||; s|/.vscode/settings.json||")
    printf "%-10s %s\n" "$color" "$project"
  fi
done | sort
