#!/usr/bin/env bash
# verify-doc.sh — check instantiated vibe documents for leftover template machinery.
#
# Usage: verify-doc.sh <file> [<file> ...]
# Reports every unfilled {{token}} and every surviving "guidance" comment,
# with file and line. Exits 0 when all files are clean, 1 when anything is found,
# 2 on usage error. Read-only; works with stock BSD or GNU grep; no dependencies.

set -u

if [ "$#" -eq 0 ]; then
  echo "usage: verify-doc.sh <file> [<file> ...]" >&2
  exit 2
fi

status=0
for f in "$@"; do
  if [ ! -f "$f" ]; then
    echo "MISSING | $f | file not found" >&2
    status=1
    continue
  fi
  # Unfilled template tokens, e.g. {{project-name}}
  if grep -n '{{[a-z][a-z0-9-]*}}' "$f" /dev/null; then
    status=1
  fi
  # Guidance comments that should have been stripped (opening line is enough:
  # multi-line comment bodies always start with this marker on their first line)
  if grep -n '<!--[[:space:]]*guidance' "$f" /dev/null; then
    status=1
  fi
done

if [ "$status" -eq 0 ]; then
  echo "CLEAN | all files | no unfilled tokens, no guidance comments"
fi
exit "$status"
