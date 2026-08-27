# vibe

> **TL;DR** — Vibe coding is easy. Staying consistent is not. This plugin is the practice that keeps a project coherent from one session to the next: a small set of living documents, each created at the moment it's needed, maintained by four commands you learn once. Install it, then start with `/vibe:my-design`.

## The problem it solves

Building with Claude gets you something working fast. What it doesn't get you, on its own, is a project that still makes sense three sessions later — when the reason a decision was made has evaporated, when the feature that got quietly cut is a surprise, when the second tool you build looks nothing like the first.

None of that is a Claude problem. It's a memory problem, and the fix is documents: a few of them, in the right places, written when they're needed rather than as homework up front. The documents do the remembering, and the commands make keeping them honest a habit rather than a chore.

## Install

```
/plugin marketplace add the-joey-ai/joey-ai
/plugin install vibe@method
```

## The four moments

Learn these in the order life happens. There's nothing else to memorise.

| Command | When | What it leaves behind |
|---|---|---|
| `/vibe:my-design` | Once, before your first project — then whenever your taste sharpens | The master `DESIGN.md` at `~/Claude/my-design/`: your design signature, carried into everything you build |
| `/vibe:new-project` | A new thing you want to exist | A scaffolded project in its own private GitHub repo with `REQUIREMENTS`, `ARCHITECTURE`, `SECURITY`, a `DESIGN` derived from your master, `CLAUDE.md`, and `AGENTS.md` |
| `/vibe:start-session` | Opening any working session | Knowing exactly where you are, documents that still tell the truth, and a `SPEC.md` for what you're building today |
| `/vibe:wrap-session` | Closing any working session | Progress banked, cuts recorded, the session logged, everything committed and pushed — so next time opens clean instead of confused |

## The documents

Each one appears when its absence would start costing you — never as a form to fill in first.

| Document | Scope | Born | What it holds |
|---|---|---|---|
| `DESIGN.md` (master) | You | `/vibe:my-design` | Your taste, made specific enough to follow: references, colour, type, layout, motion, and a do/don't table |
| `REQUIREMENTS.md` | Project | Day one | The north star. It doesn't shrink when reality bites — limitations get recorded separately and the target moves instead |
| `ARCHITECTURE.md` | Project | Day one | The pieces, how they connect, why each choice was made, and what the project depends on from outside |
| `SECURITY.md` | Project | Day one | The guardrails, written before there's code so nothing heads down a wrong path — and the checklist for ever taking a repo public |
| `DESIGN.md` (project) | Project | Day one | Your signature, translated to this platform, ending in a pass/fail checklist |
| `CLAUDE.md` + `AGENTS.md` | Project | Day one | How this project works, so any session picks it up correctly — including ones where you don't run a command |
| `SPEC.md` | Project | First session | The working plan for the current phase only. Rewritten each phase; the old ones archive to `docs/spec-history.md` |
| `ENHANCEMENTS.md` | Project | First scope cut | Where the version you actually wanted lives while Claude builds the version that ships |

## What it doesn't do

It doesn't deploy, it doesn't gate anything, and it doesn't manage what stays local-only — projects that must never leave the machine (there are a couple) simply don't run `/vibe:new-project`.

## Lineage

Personal adaptation of the work vibe plugin (v0.5.1), same principles with the team machinery removed: no shared repo, no kind-folders, no index rows, no hosting checker. One builder, one repo per project, everything private by default, wrap pushes. The adaptation decisions are in [`docs/2026-08-09-personal-adaptation.md`](docs/2026-08-09-personal-adaptation.md).
