#!/usr/bin/env bash
# package.sh — regenerate skills/<name>/ (readable SKILL.md plus the .skill download) from plugins/constitutional-pattern/skills/.
# The plugin is the source; skills/ is the copy a post links to. Run after any change to a skill, then commit both.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/plugins/constitutional-pattern/skills"
for dir in "$SRC"/*/; do
  name=$(basename "$dir"); out="$ROOT/skills/$name"; mkdir -p "$out"
  cp "$dir/SKILL.md" "$out/SKILL.md"
  ( cd "$SRC" && rm -f "$out/$name.skill" && zip -q -r "$out/$name.skill" "$name" -x "*.DS_Store" )
  echo "packaged $name"
done
