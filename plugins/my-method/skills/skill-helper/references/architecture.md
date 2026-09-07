# Architecture
How to structure a skill bundle: what goes where, when a skill needs more than one file, when it needs to be more than one skill, and the boundaries that keep skills reliable at scale.

## Anatomy of a Bundle
```
skill-name/
├── SKILL.md          ← required; frontmatter + instructions
├── references/       ← docs the agent reads when needed
├── scripts/          ← executable code for deterministic work
├── assets/           ← templates, images, files used in output
└── agents/           ← subagent instructions (rung 5 only — rare)
```

The agent loads a skill in three layers, and the whole architecture question is about placing content in the right layer:

1. **Frontmatter (`name` + `description`)** — always in context, for every skill installed, on every turn. This is the trigger. It pays permanent context rent, so it must be worth it.
2. **SKILL.md body** — loads when the skill fires. Keep it under 500 lines; well under is better. This is what the agent needs on *every* run of the skill.
3. **Bundled resources** — load on demand. Unlimited size in principle; each file loads only when its condition is met. Scripts can execute without ever being loaded into context.

The placement test: content needed on every run lives in SKILL.md; content needed on *some* runs lives in `references/` behind a conditional pointer; work that must be exact lives in `scripts/`; files that end up *in* the output live in `assets/`.

One thing to hold throughout: this anatomy is the convention that fits most skills, not a form to fill in. The structure serves the job. When the work genuinely calls for a different shape — a `data/` directory for a canonical dataset, templates organised by audience, an `agents/` directory for an orchestrator — propose that shape with its reasoning. What never bends: self-containment, conditional load pointers, and SKILL.md as the single entry point.

## Progressive Disclosure
Progressive disclosure only works when the agent knows **when** to load each file. Every file in `references/` must be pointed to from SKILL.md with an explicit condition:

- ✅ "Read `references/api-errors.md` if the API returns a non-200 status."
- ✅ "Read `references/brand-voice.md` before drafting any customer-facing copy."
- ❌ "See `references/` for more details." — the agent either loads everything (defeating the point) or nothing (orphaning the content).

Two hygiene rules that follow:

- **No orphans.** A reference file nothing points to is dead weight the user will assume is doing something. Every file earns a pointer or gets cut.
- **TOC for long references.** If a reference exceeds ~300 lines, put a table of contents at the top so the agent can jump rather than read linearly.

## The Size Ladder
When a skill feels too big, climb these rungs **in order**. Each rung is cheaper, simpler, and more maintainable than the one below it, and most oversized skills are fixed at rungs 1–2. Reaching for rung 5 first is the classic overbuild.

### Rung 1: Cut
Run the deletion test line by line: would the agent behave differently without this sentence? Content explaining things the agent already knows (what a PDF is, how HTTP works, what "professional tone" means) is the usual bulk. Overly comprehensive skills don't just waste context — they actively hurt, because the agent pursues instructions that don't apply to the current task. Detailed-and-compact beats comprehensive; this is a measured result, not a style preference.

### Rung 2: Split into References
Content that's real but situational moves to `references/` behind a conditional pointer. The strongest signal: a skill covering multiple variants of one job (AWS vs GCP, email vs push, JD vs offer letter) splits by variant — one reference each, and the agent reads only the one the task needs.

### Rung 3: Bundle Scripts
If the skill asks the agent to do exact, mechanical, repeatable work in prose — counting, parsing, validating structure, filling templates — write a script once and bundle it. Agents are good at judgment and bad at being exact; if doing step 3 before step 2 breaks everything, that's a script, not an instruction. Also watch test traces: if every test run independently reinvents the same helper logic, that logic wants to be a bundled script.

Scripts carry maintenance cost — runtime assumptions, dependencies, platform behaviour. Keep them small, name their expected inputs, and give the agent a fallback path when a script can't run. A skill must never fail silently because an interpreter wasn't where it expected.

### Rung 4: Split into Sibling Skills
Sometimes "too big" means "this is actually two skills." The scoping test is the same as deciding what a function should do: **one skill = one coherent, repeatable job** that composes well with others.

- Too narrow ("write the meta description") forces several skills to load for one task — overhead and conflicting instructions.
- Too broad ("everything about content") is impossible to trigger precisely and impossible to test.
- Right ("write a blog article from brief to publication") is one job with a definable trigger and a definable done.

**Split by decision point, not by file size.** If the workflow contains points where the input, the risk profile, or the definition of done changes — review a diff vs apply the fixes vs write the release notes — those are separate skills, even if they share domain context. Each becomes independently triggerable, testable, and maintainable.

And the persona test: "review a TypeScript PR for correctness and migration risk" is a skill; "be my senior engineer" is a persona. Personas belong in profiles and project instructions — the relationship layers — not in skills.

### Rung 5: Orchestrator + Subagents
For skills whose job genuinely decomposes into **parallel, isolated units of work** — run these five checks independently, process each file separately, grade each output against criteria — SKILL.md becomes an orchestrator: it routes, dispatches subagents, and assembles results. The per-agent instructions live in `agents/*.md`, one file per role, loaded only by the subagent that needs them — the orchestrator's own context stays lean.

Use this rung only when all three hold:

1. The units of work are genuinely independent (no unit needs another's output mid-flight).
2. Isolation adds honesty or capacity (fresh-context grading, parallel volume) that a single context can't provide.
3. The agent that runs the skill has subagents (Claude Code, Cursor, and Codex do). A skill that will run somewhere without them needs an explicit sequential fallback, which doubles the maintenance surface. Say so before choosing this rung.

A sequential workflow dressed up as subagents gains nothing and loses debuggability. When in doubt, rung 4.

## The No-daisy-chain Rule
**A skill must never invoke or depend on another skill at runtime.** This is a hard rule, and the reasons are structural, not stylistic:

- **Install-base fragility.** The other skill may not be installed for this user, and the failure will be silent and confusing.
- **Version drift.** The two skills version independently; the chain breaks the day one of them changes shape, and nobody owns the seam.
- **Non-deterministic triggering.** Skill invocation isn't a function call — it's a routing decision the agent makes. A chain multiplies each link's miss rate.

When two skills genuinely share a workflow, they share **process artifacts**: a record one creates and the other reads, a thread one opens and the other posts to, files in a folder both know about. The artifact is durable, inspectable, and survives either skill breaking. (In this pack the artefacts are files in the project folder: the `SPEC.md` that start-session writes and wrap-session trues up, the session log one skill appends and the other reads.)

What the rule does **not** forbid: telling the *user* what to run next. "When this passes, run [the next skill in your process]" is process guidance to a human, not runtime chaining — the human is the link, and humans handle missing skills gracefully.

## Self-containment Audit
Run this on every build, extraction, and improvement before packaging. The single most common silent failure in user-built skills is a reference that lives outside the bundle — the skill works on the author's machine and fails, inconsistently and confusingly, everywhere else.

1. **Path scan.** Search every file in the bundle for absolute paths (`/Users/`, `/mnt/`, `C:\`, `~/`) and for references to files by name. Every hit either points inside the bundle (relative path), or is a declared assumption the skill states up front (a pack may name the folder it is installed in), or gets the content pulled *into* the bundle.
2. **Pointer check.** Every file in `references/`, `scripts/`, and `assets/` is pointed to from SKILL.md with a when-to-load condition. No orphans in either direction.
3. **Dependency honesty.** External *services* (an MCP, an API) can't be bundled — so they must be named in the skill with a clear behaviour for when they're absent ("if the connector isn't available, tell the user which one to enable and stop"). A URL the skill must fetch at runtime is a dependency too — treat it the same way, and prefer pulling stable content into `references/` at build time.
4. **Source vs output.** The skill folder is immutable source — reviewed, versioned, safe to reinstall. Nothing in the skill may write state into its own bundle; run artifacts and outputs go to the user's workspace.
