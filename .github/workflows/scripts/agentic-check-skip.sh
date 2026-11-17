#!/usr/bin/env bash
# Removes from the current repository what the given skip lists name, after `agentic.check --yes` installed it.
# Usage: agentic-check-skip.sh <skip-list>...
# A list that doesn't exist is ignored, so a repository's own list is optional.
# The format is described in ../config/agentic-check-skip.txt.
set -euo pipefail

remove_directive() {
  local name="$1" file
  for file in AGENTS.md CLAUDE.md; do
    [[ -f "$file" ]] || continue
    # Drops the block and the blank line agentic.check puts before it.
    awk -v start="<!-- $name:start -->" -v end="<!-- $name:end -->" '
      $0 == start { skipping = 1; if (blanks > 0) blanks--; next }
      skipping { if ($0 == end) skipping = 0; next }
      $0 == "" { blanks++; next }
      { while (blanks > 0) { print ""; blanks-- } print }
      END { while (blanks > 0) { print ""; blanks-- } }
    ' "$file" > "$file.tmp"
    mv "$file.tmp" "$file"
  done
}

remove_skill() {
  local name="$1" dir
  # find, not a .*/ glob, which can match .. and reach outside the repository.
  find . -mindepth 3 -maxdepth 3 -type d -path "./.*/skills/$name" -exec rm -r -- {} +
}

remove_badge() {
  [[ -f README.md ]] || return 0
  # Drops the badge line and the blank line agentic.check adds after it.
  awk '
    /^\[!\[built with: dna\]/ { dropped = 1; next }
    dropped && $0 == "" { dropped = 0; next }
    { dropped = 0; print }
  ' README.md > README.md.tmp
  mv README.md.tmp README.md
}

for list in "$@"; do
  [[ -f "$list" ]] || continue
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="${line//[[:space:]]/}"
    case "$line" in
      "") ;;
      directive:?*) remove_directive "${line#directive:}" ;;
      skill:?*) remove_skill "${line#skill:}" ;;
      badge) remove_badge ;;
      *) echo "error: unknown entry '$line' in $list" >&2; exit 1 ;;
    esac
  done < "$list"
done
