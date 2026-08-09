---
name: new-project
description: "Start a new project the vibe way — the kickoff conversation that turns an idea into a scaffolded project in its own private GitHub repo, carrying its north-star documents: REQUIREMENTS, ARCHITECTURE, SECURITY, a DESIGN derived from the master, plus CLAUDE.md and AGENTS.md. Use when Joey says “I want to build...”, “start a new project”, “new tool for...”, “help me set this up properly”, or invokes the command. Ends with an empty-but-correct project pushed to the-joey-ai — deliberately not with feature code, and never with a SPEC: the first /vibe:start-session writes that and begins the building."
---

# New Project

Kickoff is about **what and why**, never how-to-build-it. What this produces is understanding made durable, plus an empty project in the right place with the right documents around it. The building starts next session — and it goes faster because of this one.

Resist the pull to start coding. Arriving excited usually means wanting something on screen in ten minutes, and that instinct is exactly what produces the project nobody can extend in three weeks. Say what you're doing and why: this half hour is what makes every session after it cheap.

Ask one question at a time, in plain language. Use `AskUserQuestion` only for genuine either/or forks; open questions want open answers.

## The templates

All of them sit in `templates/` at the root of this plugin — from this skill's own folder, that is `../../templates/`. **Before instantiating the first one, read `../../templates/README.md`** — the single contract for filling, stripping, and verifying every template. After writing each document, run `../../scripts/verify-doc.sh` on it.

| Template | Becomes | Stage |
|---|---|---|
| `REQUIREMENTS.md` | the project's `REQUIREMENTS.md` | 1 |
| `ARCHITECTURE.md` | the project's `ARCHITECTURE.md` | 2 |
| `SECURITY.md` | the project's `SECURITY.md` | 3 |
| `DESIGN-project.md` | the project's `DESIGN.md` | 4 |
| `CLAUDE-project.md` | the project's `CLAUDE.md` | 5 |
| `AGENTS.md` | the project's `AGENTS.md` | 5 |

## Stage 1 — The idea, in his words

Start with the thing he came to say. "Tell me what should exist, and who it's for."

Then draw out three things, without turning it into an interrogation:

- **What it is when it's fully itself.** The whole ambition, not the achievable slice. This becomes the north star, and its job is to stay fixed while everything else adjusts around it.
- **Who uses it, and what it replaces.** Joey himself, the household, readers — and what happens today instead: a manual process, an app that almost works, nothing at all. This is the sharpest test of whether it's worth building, and it defines what "better" means concretely.
- **What v1 has to do to be worth using at all.** Push for the short list. If it runs past about six things, say so — that's two versions wearing one name, and naming that now is a kindness.

Write `REQUIREMENTS.md` from its template. Read the north star back before you write it, in his words rather than yours. If he corrects you, the correction is the real requirement.

Anything wanted that isn't in v1 goes in "What it deliberately does not do yet" — being written down is what makes it safe to leave out.

## Stage 2 — How it gets assembled

Ask in plain language and translate; the architecture should be readable without learning vocabulary first.

The five questions that shape everything:

1. **"Does it need to remember things between uses, or does it start fresh each time?"** Remembering means a database or a state file. Starting fresh means a much simpler thing, and it's worth saying so plainly — a lot of good tools remember nothing.
2. **"Where does the information come from today?"** A feed, another system's API, a folder on the iMac, typed in by hand, nowhere yet. This is the single most useful architectural fact, and it usually decides the shape.
3. **"Where does it run?"** The iMac (a container on OrbStack, a launchd job), a hosted platform, the phone, this laptop only. The answer writes ARCHITECTURE's "Where it runs" and CLAUDE.md's local-only ground — the section that tells a cloud session what it can't reach.
4. **"Does it need to talk to anything outside itself?"** An API, a service on the LAN, an email, a notification. Every one becomes a dependency row with where its access lives (a key name in `secrets.env`, a 1Password entry, a subscription).
5. **"Is any part of this meant to be reachable by anyone but you?"** The household over the LAN or tailnet, the public internet, nobody. Ask it even when confident of the answer, because getting it wrong late is expensive — a public surface is a structural decision, and it changes what SECURITY.md has to say.

Write `ARCHITECTURE.md` from its template. Describe each piece in plain terms with the technical name in parentheses. Record every decision with its reasoning; when a choice was close, record the option not taken and what would make it the better call. That's the difference between a decision a future session can reason about and one it can only obey.

## Stage 3 — Guardrails, before there's code

`SECURITY.md` gets written now rather than later, so nothing heads down a wrong path while the rules are still unwritten. Use its template: the four absolutes ship verbatim, and you fill three sections from what Stages 1 and 2 already told you.

- **What data this project handles** — name every kind, and where each lives. Be specific enough to check later.
- **Where credentials actually live** — by name only, pointing at the gitignored `secrets.env` / 1Password / keychain. If there are none, one line saying so.
- **Project-specific guardrails** — anything this project holds itself to beyond the absolutes.

If an honest answer touches one of the absolutes, stop and work out the handling before building. Being near one rarely kills a project; it usually means the data gets handled differently or the repo's boundary tightens.

## Stage 4 — Deriving the design

Read the master at `~/Claude/my-design/DESIGN.md` and write the project's `DESIGN.md` from `../../templates/DESIGN-project.md`.

Take the **Signature** wholesale — that's taste, and it travels. Take **Execution notes** only for this project's platform; a recipe for a different platform will mislead. Then record the translation explicitly: what carried over unchanged, and what had to become something else because this platform works differently. Say plainly that the philosophy is unchanged and only the mechanics moved. That paragraph is what stops a later session either ignoring the master or lifting something from it that makes no sense here.

Finish with the verification checklist — binary items, grouped by area, each one settleable by looking at the screen. Derive them from the master's Do/Don't table and the concrete values you just wrote.

**No master yet?** Say so and offer `/vibe:my-design` first — it's a short conversation and everything downstream gets better. If he'd rather keep moving, ask three quick taste questions, write a starter design from the answers, and note in the file that the master is owed. Don't let the absence of a master become the absence of a design.

**Headless project?** A scheduled script or a server with no interface still gets a DESIGN.md if it produces anything a person reads — digests, notifications, reports have a voice and a format worth pinning. If it genuinely produces nothing human-facing, skip the file and say so in CLAUDE.md's document table.

## Stage 5 — Placement, then scaffold

One project = one folder = one private repo. In order:

1. **Name it** — kebab-case, and it's worth getting right: the folder name becomes the repo name becomes how every session refers to it. Existing conventions: `joey-plus-*` for pillars of the media platform; plain names otherwise.
2. **Place it** — default `~/Claude/Cowork/<name>` (the standing home for projects; Cowork, Claude Code, and the repo all point at the same folder). Xcode apps live under `~/Coding/Xcode/<Name>` instead. Ask only if it's genuinely ambiguous.
3. **Scaffold to match `ARCHITECTURE.md`** — the structure, not the features. Write a `.gitignore` before anything else: `.DS_Store`, `secrets.env`, caches, logs, build output. If it's a code project, match the stack conventions of the nearest sibling project (the joey-plus pillars for iMac services, the Joey browser for Swift).
4. **Write `CLAUDE.md` and `AGENTS.md`** from their templates. The character paragraph in `CLAUDE.md` is the highest-value block in the project — pull it from the north star and write it as character, not features. Fill local-only ground from Stage 2's question 3.
5. **Create the repo and push:** `git init -b main`, first commit, `gh repo create the-joey-ai/<name> --private --source . --push`. Private is the default, always — public is a deliberate decision that goes through SECURITY.md's "Before going public" checklist, and it's not made at kickoff.

## Close

Say plainly what now exists, and what happens next: the documents are written, the project is placed and pushed, and building starts with `/vibe:start-session`, which will write the first `SPEC.md`. Then stop.

## Boundaries

- **Never write `SPEC.md`.** Kickoff is what and why; the spec is how, and it belongs to the first working session.
- **Don't build features.** If Joey pushes to keep going, that's a good sign — point it at `/vibe:start-session` and it becomes the first phase.
- **Never make a repo public here.**

## What to know going in

- **Anything that remembers things needs a real store, not wishful thinking.** Where state lives (a JSON file the project owns, SQLite, Postgres in a container) is a decision for ARCHITECTURE.md's table, made deliberately.
- **The framework may be newer than what you know.** Scaffolding tools install current versions whose conventions can differ from training data, and the errors are confusing rather than obvious. Read the installed version's own docs before writing code against it, and note in the project's CLAUDE.md house rules that this project does so.
- **Local-only projects exist and don't come through here.** Something that must never leave the machine (the iphone-mvt pattern — its secrets are the point) doesn't get a repo, and that's a decision to respect, not fix.
