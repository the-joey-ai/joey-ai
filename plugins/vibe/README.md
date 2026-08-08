# vibe

A working standard for Claude Code projects. One living canon ([DESIGN.md](DESIGN.md)) that every project derives its structure from; six sister files per project with CLAUDE.md as the centre point; and two session rituals that keep the documents true and the work on GitHub.

## Install

```
/plugin marketplace add the-joey-ai/joey-ai
/plugin install vibe@joey-ai
```

## Use

| Command | What it does |
|---|---|
| `/vibe:init` | Bring a project into the system — scaffold or backfill the sister files from the canon, set up git + .gitignore, run a secrets pass, connect the GitHub remote (private by default) |
| `/vibe:start-session` | Open a session — read CLAUDE.md, reconcile git state, catch up to any canon changes, orient before acting |
| `/vibe:wrap-session` | Close a session — update the sister files the work touched, refresh Active State + Session Log, secrets check, commit and push |

## The idea

Projects rot in the gap between the work and the record of the work. vibe closes the gap structurally: the documents are few and each holds one kind of truth, the canon is amended in one place and propagates at session start, and a session isn't over until the repo on GitHub is the complete, true record. See [DESIGN.md](DESIGN.md) — the canon is the product.
