#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Version (e.g. 0.1.0) required}"
OUTPUT="${2:-RELEASE_NOTES.md}"

awk -v ver="$VERSION" '
  /^## / {
    if (section) exit
    if ($2 ~ "^\\[" ver "\\]") section=1
  }
  section { print }
' CHANGELOG.md > "$OUTPUT"

echo "Release notes written to $OUTPUT"
