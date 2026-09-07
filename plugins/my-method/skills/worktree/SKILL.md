---
name: worktree
description: "Starts, lists, and lands git worktrees on the repo the user is standing in, so they never do git by hand: start makes a branch and a worktree under .worktrees/<branch> from a fresh main; status shows the branch, what is ahead or behind, what is dirty, and which worktrees are merged; land merges the branch into main with a merge commit, pushes when a remote exists, and removes the worktree and the branch. Use when the user says \"start a branch\", \"make a worktree\", \"work on this on a branch\", \"what's checked out\", \"is anything behind\", \"land this\", \"merge this back\", \"clean up worktrees\", or invokes the command. Not the working session itself (start-session, wrap-session), and it never resolves a merge conflict silently."
---

# Worktree
*A branch is a worktree, and landing closes both.*

The owner does not want to be a git expert; they want to always be working correctly with it. Every verb here is one script call, so the state of the repo is visible in one table and nothing is reasoned about from memory.

## The Script
`scripts/worktree.sh` in this skill's folder, with the verbs `start <branch>`, `status`, `land <branch>`, `prune [--yes]`. It works on whichever repo the current directory is inside, keeps worktrees under `.worktrees/` in that repo (excluded from git through `.git/info/exclude` on first use, so nothing is committed for it), and needs nothing but git. Run it before answering any git question; do not reason about repo state from memory. If the script cannot run, say so and do the same steps with plain git, naming each command.

## Start
1. `worktree.sh start <branch>`. The script branches from `origin/main` when a remote exists (after a fetch) or from local `main` when it does not, and prints the worktree path.
2. Say the path in one line, and what done looks like for the branch. Work in that path.
3. If the project keeps a `SPEC.md`, note the branch name in its progress notes so the next session knows where the work lives.

## Status
`worktree.sh status`. Report only what needs the user: a branch behind its remote (offer a pull), a dirty tree, a worktree marked merged (offer `prune`). A clean table is one line: `On main, level with origin; nothing checked out.`

## Land
1. Commit inside the worktree first; the script refuses an uncommitted worktree and a dirty main.
2. `worktree.sh land <branch>`: merges into main with a merge commit, pushes if there is a remote, removes the worktree, deletes the branch.
3. Say the merge commit in one line. If the project keeps a `SPEC.md`, clear the branch note.
4. `worktree.sh prune` to catch anything else that was merged; `--yes` after the user sees the list.

## Gotchas
- Claude Code and Cursor can make their own worktrees in their own places; `status` only sees the ones under `.worktrees/`. If the user mentions a branch the table does not show, `git worktree list` finds it.
- A branch name with a slash makes a nested folder under `.worktrees/`; that is fine, but the land command wants the full name.
- Never land a branch the user has not said is finished; "is this done?" is a question for them, not the script.

## When Things Go Sideways
- **Merge conflict on land.** Stop. Name the files. Ask which side wins; never resolve a conflict silently.
- **Push rejected.** `git pull --ff-only origin main` and retry once; if it still fails, show the error and stop.
- **Worktree exists for that branch.** Use it; do not make a second.
- **No remote.** Everything works locally; say so once and do not offer to push.

The owner of this method owns these standards; they are current, not permanent. When a step here fights real use, note it in the project's `ENHANCEMENTS.md` under Known gaps.
