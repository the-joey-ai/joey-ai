#!/usr/bin/env bash
# worktree.sh — branches as worktrees for the repo you are standing in, so nobody does git by hand.
# Usage: worktree.sh start <branch>     new branch and worktree at .worktrees/<branch>, from origin/main when a remote exists, else from main
#        worktree.sh status             this repo: branch, ahead, behind, dirty, remote; every worktree and whether its branch is merged
#        worktree.sh land <branch>      merge the branch into main (merge commit), push if a remote exists, remove the worktree and the branch
#        worktree.sh prune [--yes]      list (or remove with --yes) worktrees whose branch is already merged into main
# Run from anywhere inside the repo. .worktrees/ is kept out of git through .git/info/exclude, so main stays clean.
# Refuses to land over a dirty main or an uncommitted worktree. Never force-pushes.
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "not inside a git repo" >&2; exit 2; }
WT="$ROOT/.worktrees"
has_remote() { git -C "$ROOT" remote get-url origin >/dev/null 2>&1; }
main_ref() { if has_remote; then git -C "$ROOT" fetch -q origin main && echo origin/main; else echo main; fi; }
ensure_ignored() { local ex="$ROOT/.git/info/exclude"; grep -qx '.worktrees/' "$ex" 2>/dev/null || echo '.worktrees/' >> "$ex"; }
case "${1:-}" in
  start)
    br="${2:?usage: worktree.sh start <branch>}"; path="$WT/$br"
    [ -d "$path" ] && { echo "worktree already exists: $path"; exit 0; }
    ensure_ignored; mkdir -p "$WT"
    git -C "$ROOT" worktree add -q -b "$br" "$path" "$(main_ref)"
    echo "$path";;
  status)
    b=$(git -C "$ROOT" rev-parse --abbrev-ref HEAD)
    ahead=$(git -C "$ROOT" rev-list --count @{u}..HEAD 2>/dev/null || echo -)
    behind=$(git -C "$ROOT" rev-list --count HEAD..@{u} 2>/dev/null || echo -)
    dirty=$(git -C "$ROOT" status --porcelain | wc -l | tr -d ' ')
    remote=$(git -C "$ROOT" remote get-url origin 2>/dev/null || echo none)
    printf "branch %s  ahead %s  behind %s  dirty %s  remote %s\n" "$b" "$ahead" "$behind" "$dirty" "$remote"
    git -C "$ROOT" worktree list --porcelain | awk '/^worktree /{p=$2} /^branch /{print p, $2}' | while read -r p ref; do
      [ "$p" = "$ROOT" ] && continue; brn=${ref#refs/heads/}
      m=""; git -C "$ROOT" branch --merged main 2>/dev/null | grep -q " ${brn}$" && m="  (merged, prune it)"
      d=$(git -C "$p" status --porcelain | wc -l | tr -d ' ')
      printf "  worktree %-24s %s  dirty %s%s\n" "$brn" "$p" "$d" "$m"
    done;;
  land)
    br="${2:?usage: worktree.sh land <branch>}"; path="$WT/$br"
    [ -n "$(git -C "$ROOT" status --porcelain)" ] && { echo "main is dirty; commit or stash first" >&2; exit 1; }
    [ -d "$path" ] && [ -n "$(git -C "$path" status --porcelain)" ] && { echo "worktree has uncommitted work; commit it first" >&2; exit 1; }
    git -C "$ROOT" checkout -q main
    has_remote && git -C "$ROOT" pull -q --ff-only origin main
    git -C "$ROOT" merge --no-ff -q -m "Land $br" "$br"
    has_remote && git -C "$ROOT" push -q origin main
    [ -d "$path" ] && git -C "$ROOT" worktree remove "$path"
    git -C "$ROOT" branch -d "$br"
    git -C "$ROOT" log -1 --format='landed %h %s';;
  prune)
    git -C "$ROOT" worktree list --porcelain | awk '/^worktree /{p=$2} /^branch /{print p, $2}' | while read -r p ref; do
      [ "$p" = "$ROOT" ] && continue; brn=${ref#refs/heads/}
      if git -C "$ROOT" branch --merged main | grep -q " ${brn}$"; then
        if [ "${2:-}" = "--yes" ]; then git -C "$ROOT" worktree remove "$p" && git -C "$ROOT" branch -d "$brn" && echo "removed $brn"; else echo "merged: $brn ($p)"; fi
      fi
    done;;
  *) sed -n '2,7p' "$0"; exit 2;;
esac
