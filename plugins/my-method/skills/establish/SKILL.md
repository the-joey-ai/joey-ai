---
name: establish
description: "Puts a project folder into the shape this method uses: REQUIREMENTS, ARCHITECTURE, SECURITY, an AGENTS.md that every agent reads, and a CLAUDE.md that points at it. Two modes: new (an idea, no folder yet; a kickoff conversation about what and why, then an empty-but-correct project) and adopt (a folder or repo already exists; reconstruct the documents honestly from what is there, never bulldozing an instruction file that works). Use when the user says \"I want to build...\", \"start a new project\", \"set this up properly\", \"adopt this folder\", \"bring this project into the method\", or invokes the command. Never writes SPEC.md or feature code: the first start-session does that. Not for opening a working session (start-session) and not for writing skills (skill-helper)."
---

# Establish

Establish is about **what and why**, never how-to-build-it. What it produces is understanding made durable: a folder with the right documents around it, and an instructions file every agent reads the same way. The building starts next session — and it goes faster because of this one.

Resist the pull to start coding. Arriving excited usually means wanting something on screen in ten minutes, and that instinct is exactly what produces the project nobody can extend in three weeks. Say what you're doing and why: this half hour is what makes every session after it cheap.

Ask one question at a time, in plain language. Use a question picker (`AskUserQuestion` where it exists) only for genuine either/or forks; open questions want open answers. If no picker exists, ask in chat.

## Mode

Decide first, say it in one line.

- **New**: nothing exists yet. Run the stages below in order.
- **Adopt**: a folder or repo exists. Read everything in it before asking anything, then **read `references/adopting-a-project.md`** — it is the playbook for reconstructing each document honestly and absorbing an existing instructions file rather than replacing it. Stages 1 to 3 still run, but most answers come from the folder and get read back for correction rather than asked cold.

## The templates

All of them sit in `templates/` at the root of this plugin — from this skill's own folder, that is `../../templates/`. **Before instantiating the first one, read `../../templates/README.md`** — the single contract for filling, stripping, and verifying every template. After writing each document, run `../../scripts/verify-doc.sh` on it.

| Template | Becomes | Stage |
|---|---|---|
| `REQUIREMENTS.md` | the project's `REQUIREMENTS.md` | 1 |
| `ARCHITECTURE.md` | the project's `ARCHITECTURE.md` | 2 |
| `SECURITY.md` | the project's `SECURITY.md` | 3 |
| `AGENTS.md` | the project's `AGENTS.md` | 4 |
| `CLAUDE.md` | the project's `CLAUDE.md` (a pointer) | 4 |

## Stage 1 — The idea, in their words

Start with the thing they came to say. "Tell me what should exist, and who it's for."

Then draw out three things, without turning it into an interrogation:

- **What it is when it's fully itself.** The whole ambition, not the achievable slice. This becomes the north star, and its job is to stay fixed while everything else adjusts around it.
- **Who uses it, and what it replaces.** The owner, a team, customers, readers — and what happens today instead: a manual process, an app that almost works, nothing at all. This is the sharpest test of whether it's worth building, and it defines what "better" means concretely.
- **What v1 has to do to be worth using at all.** Push for the short list. If it runs past about six things, say so — that's two versions wearing one name, and naming that now is a kindness.

Write `REQUIREMENTS.md` from its template. Read the north star back before you write it, in their words rather than yours. If they correct you, the correction is the real requirement.

Anything wanted that isn't in v1 goes in "What it deliberately does not do yet" — being written down is what makes it safe to leave out.

## Stage 2 — How it gets assembled

Ask in plain language and translate; the architecture should be readable without learning vocabulary first.

The five questions that shape everything:

1. **"Does it need to remember things between uses, or does it start fresh each time?"** Remembering means a database or a state file. Starting fresh means a much simpler thing, and it's worth saying so plainly — a lot of good tools remember nothing.
2. **"Where does the information come from today?"** A feed, another system's API, a folder on a machine, typed in by hand, nowhere yet. This is the single most useful architectural fact, and it usually decides the shape.
3. **"Where does it run?"** A laptop only, a home server, a container, a scheduled job, a hosted platform, a phone. The answer writes ARCHITECTURE's "Where it runs" and AGENTS.md's local-only ground — the section that tells a cloud session what it can't reach.
4. **"Does it need to talk to anything outside itself?"** An API, a service on the network, an email, a notification. Every one becomes a dependency row with where its access lives (a key name in `secrets.env`, a password-manager entry, a subscription).
5. **"Is any part of this meant to be reachable by anyone but you?"** A household or team over the network, the public internet, nobody. Ask it even when confident of the answer, because getting it wrong late is expensive — a public surface is a structural decision, and it changes what SECURITY.md has to say.

Write `ARCHITECTURE.md` from its template. Describe each piece in plain terms with the technical name in parentheses. Record every decision with its reasoning; when a choice was close, record the option not taken and what would make it the better call. That's the difference between a decision a future session can reason about and one it can only obey.

## Stage 3 — Guardrails, before there's code

`SECURITY.md` gets written now rather than later, so nothing heads down a wrong path while the rules are still unwritten. Use its template: the four absolutes ship verbatim, and you fill three sections from what Stages 1 and 2 already told you.

- **What data this project handles** — name every kind, and where each lives. Be specific enough to check later.
- **Where credentials actually live** — by name only, pointing at the gitignored `secrets.env`, the keychain, or the password manager. If there are none, one line saying so.
- **Project-specific guardrails** — anything this project holds itself to beyond the absolutes.

If an honest answer touches one of the absolutes, stop and work out the handling before building. Being near one rarely kills a project; it usually means the data gets handled differently or the repo's boundary tightens.

## Stage 4 — Placement, then scaffold

One project = one folder. In order:

1. **Name it** — kebab-case, and it's worth getting right: the folder name becomes how every session refers to it, and the repo name if there is one.
2. **Place it** — ask where the project should live; the user decides, and the answer is usually one parent folder everything sits under. Never assume a home. Adopt mode skips this: the folder is where it is.
3. **Scaffold to match `ARCHITECTURE.md`** — the structure, not the features. Write a `.gitignore` before anything else: `.DS_Store`, `secrets.env`, caches, logs, build output, `.worktrees/`.
4. **Write `AGENTS.md` and `CLAUDE.md`** from their templates. `AGENTS.md` is the instructions file: Cursor and Codex read it directly, and Claude Code reaches it through `CLAUDE.md`, which stays a pointer. The character paragraph in `AGENTS.md` is the highest-value block in the project — pull it from the north star and write it as character, not features. Fill local-only ground from Stage 2's question 3.
5. **Git, then ask about a remote.** `git init -b main` and a first commit if the folder isn't a repo yet. Then one question: "Should this live on GitHub?" If yes, `gh repo create <owner>/<name> --private --source . --push` — private always; public is a deliberate decision that goes through SECURITY.md's "Before going public" checklist, and it's not made here. If no, say so in AGENTS.md's repo line and move on; a folder with commits and no remote is a complete project.

## Close

Say plainly what now exists, and what happens next: the documents are written, the project is placed, and building starts with start-session, which will write the first `SPEC.md`. Then stop.

## Boundaries

- **Never write `SPEC.md`.** Establish is what and why; the spec is how, and it belongs to the first working session.
- **Don't build features.** If the user pushes to keep going, that's a good sign — point it at start-session and it becomes the first phase.
- **Never make a repo public here.**
- **Adopt mode changes documents only, never code.** The moment you want to change what exists, that's a phase.

## Gotchas

- **An existing `CLAUDE.md` with real content is absorbed, not replaced.** Its house rules, session log, and inventory move into `AGENTS.md`; the pointer goes in its place. Read `references/adopting-a-project.md` before touching it.
- **A tool-managed block in either instructions file** (framework scaffolders write these, marked BEGIN/END) stays where it is, with the pointer text above it. Removing it starts a fight you lose silently.
- **Anything that remembers things needs a real store, not wishful thinking.** Where state lives is a decision for ARCHITECTURE.md's table, made deliberately.
- **The framework may be newer than what you know.** Scaffolding tools install current versions whose conventions can differ from training data. Read the installed version's own docs before writing code against it, and note in AGENTS.md's house rules that this project does so.
- **Some projects must never leave the machine.** If the secrets are the point, no remote, and that's a decision to respect, not fix.

The owner of this method owns these standards; they are current, not permanent. When a step here fights real use, note it in the project's `ENHANCEMENTS.md` under Known gaps rather than working around it silently.
