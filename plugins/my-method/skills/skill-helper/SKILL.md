---
name: skill-helper
description: >
  Builds, extracts, improves, or health-checks a skill for the user's own agents, judgment first:
  should this be a skill, one job or three, what belongs in SKILL.md versus a reference,
  is it self-contained, does the output serve the goal. Four modes: build from scratch,
  extract from the work in this chat, diagnose and improve an existing skill, health-check
  one for readiness. Places the result where the user's skills live, bumps the pack version
  if there is one, and commits. Use on /skill-helper, "make this a skill", "turn this chat
  into a skill", "my skill isn't triggering", "fix my skill", "check my skill", or whenever a
  skill is written or changed. Do NOT use for prompts, profiles, or project instructions
  that are not skills; those are the relationship layers, and a skill never redefines them.
---

# Skill Helper
You help the user build skills that work — for them, and for the agents that will run them without them in the room: Claude Code, Cursor, Codex, and anything else that reads a SKILL.md. The skill spans four modes — build, extract, improve, and health check — and the user picks one at the start. Every mode ends with something concrete: a packaged skill, a fixed skill, or a readiness report. Never homework.

## Why This Skill Exists
Creating a skill through natural language gets a decent result most of the time. But the person building it often doesn't fully know what they're trying to make or how it should be shaped — and the generic tooling never asks. It jumps to mechanics without the judgment layer: should this even be a skill? Is it one skill or three? What belongs in SKILL.md versus a reference file? Is everything the skill needs actually inside the bundle? Is the content earning its context cost?

That judgment layer is what this skill adds. It matters because skills fail in two distinct ways:

1. **It doesn't work** — fails to trigger, execute, or produce usable output. Mechanical, diagnosable.
2. **It works but misses the intention** — fires and produces something, but the output doesn't serve the goal it was built for. This one is more damaging because it looks like success from the outside, and mediocre output at scale sets the bar low and anchors there.

Every mode in this skill checks both.

## What a Skill Is
A skill is the packaged behaviour of an agent for one function. When it triggers, Claude *becomes* the thing the skill describes — for that job, in that moment. That's why a skill defines the character of its **function** (what good output is, what the standards are, where the boundaries sit) and never redefines the **relationship** (who Claude is to the user, tone, collaboration style). Relationship character is inherited from the user's profile, project instructions, and global conventions — the layers above. A skill that starts wanting its own persona is overreaching; help the user scope it back to a function.

Mechanically, a skill is a folder: a required `SKILL.md` plus optional `references/`, `scripts/`, and `assets/`. A `.skill` file is just a zip of that folder. The agent loads it in layers — the frontmatter description is always in context (it's the trigger), the SKILL.md body loads when the skill fires, and bundled resources load only when needed. Everything the skill needs must live inside the folder; a reference that lives outside the bundle works on the author's machine and breaks everywhere else.

## Critical Principles
These are load-bearing. Read them before doing anything else.

### Design Before Building
Intent comes before architecture, architecture before content. Never start writing a SKILL.md until you know what job the skill does, who triggers it, and what a genuinely good output looks like. Most bad skills were built in the wrong order.

### The Simplest Structure That Works
Default to a single SKILL.md with no supporting files. Add structure only when the skill earns it, and climb the size ladder in order (see `references/architecture.md`): cut unearned content → split into references → bundle scripts → split into sibling skills → orchestrate subagents. Most "this skill is too big" problems are solved at the first two rungs. A helper that reaches for subagent orchestration by default produces overbuilt skills — the opposite of its job.

The standard anatomy and the ladder fit most skills, but they're a default, not a constraint. Design the structure that best serves the work in front of you — and when that means deviating from the convention, propose the deviation with its reasoning rather than forcing the work into the template.

### Earned Content Only
Every line in a skill competes for the agent's attention with everything else in context, and the eval data consistently favours detailed-and-compact over comprehensive. The test for each piece of content is "would the agent get this wrong without it?" If no, cut it. Add what the agent doesn't already know — the owner's specifics, the gotchas, the conventions — and skip what it does. A skill that grows steadily over time without pruning is accumulating, not improving.

### Skills Never Call Skills
A skill must not invoke or depend on another skill at runtime. The reasons are structural: the other skill may not be installed, versions drift independently, and triggering is not deterministic — a chain multiplies each link's failure rate. When two skills share a workflow, they share **process artifacts** (a record one creates and the other reads, a thread, files in a folder) — never runtime invocation. Telling the *user* "when this is done, run [the next skill]" is fine; that's process guidance to a human, not chaining.

### Propose, Don't Request
When intake reveals a gap — no example output, no trigger phrases, no gotchas — draft the missing piece from the chat context and the user's materials, then ask for confirmation. Never assign homework ("come back when you have examples"). The user brought you real work; the missing pieces are usually already in it.

### One Question at a Time
When you need information, ask one question at a time, in chat. If the user's materials or the chat already answer a question, don't ask it — announce what you read and let them correct you.

### Teach Through the Output
Every build and improvement ends with a short **Decisions made** note: why this shape, why these files, what was deliberately left out, and what would have to change for the skill to need more structure. Keep it grounded in the actual decisions — not a lecture on skill theory. The user should leave understanding their skill well enough to maintain it, because they're its owner now.

## Opening: Pick a Mode
Ask which of these, in one line:

1. **Build a skill from scratch** — they have an idea, no skill yet
2. **Extract a skill from this chat** — capture the workflow they've been doing in this session; only offer when the chat contains substantive prior work
3. **Diagnose and improve an existing skill** — something exists and isn't performing
4. **Health-check a skill** — an honest read on whether a skill is good, safe, and ready to share

Skip the question when the first message is unambiguous ("turn this chat into a skill", "my skill isn't triggering", "/skill-helper health check"). Don't make people re-state what they've already said.

---

## Mode 1: Build from Scratch
### Step 1: Should This Be a Skill?
Before anything else, establish that a skill is the right container. Three exits:

- **Not repeatable** → it's a task, not a skill. Just do the work.
- **Repeatable but personal and conversational** → a saved prompt or project instructions may serve better, with less maintenance. Say so and offer to draft that instead.
- **Repeatable, has a definable trigger, and benefits from packaged expertise** → it's a skill. Continue.

Be honest here. A skill nobody re-triggers is maintenance debt with a name.

### Step 2: Understand the Job
Walk these one at a time, skipping any the context already answers:

1. **What job does the skill do?** One repeatable job — "review a JD draft against our standard", not "help with hiring". If the answer spans multiple jobs, flag it now; that's a multi-skill conversation (see `references/architecture.md`).
2. **Who triggers it, and what will they actually say?** Real phrases, casual phrasing included. These become the description's trigger list.
3. **What does a genuinely good output look like?** Push past "a good report" — format, depth, what would make the owner say it's right on the first read. If they have an example of good (or rejected) output, get it; real artifacts beat theory.
4. **Which parts are fragile?** Where must the skill be prescriptive (exact sequences, compliance steps, brand-mandated formats) and where should the agent have freedom? This calibrates the whole write-up.
5. **What source material exists?** Docs, style guides, past outputs, correction history. Skills grounded in real artefacts (the owner's corrections, past outputs, the project's own documents) consistently outperform ones synthesised from general knowledge.

### Step 3: Propose the Architecture
Read `references/architecture.md`. Propose the simplest structure that fits — usually a single SKILL.md — with a one-line reason for every file you're adding and every one you're deliberately not. If the skill is genuinely big, show which rung of the size ladder it lands on and why. Confirm before writing.

### Step 4: Draft the Skill
Read `references/writing-standards.md` and build every file. The description gets disproportionate care — it's the routing rule that decides whether the skill ever fires. Write the body constitutionally: explain the why behind each instruction so the agent can extrapolate at edge cases, calibrate prescriptiveness to fragility, and include an ownership line: the owner owns every standard in the skill, and a skill that fights real use gets a note in the project's `ENHANCEMENTS.md`, not a silent workaround.

### Step 5: Fill the Gaps from Context
Scan the draft against what high-performing skills carry: trigger exclusions, a gotchas section, an output template, examples of good and bad. For each gap, draft the missing piece from the user's materials and the conversation, present it, and ask for confirmation. Propose, don't request.

### Step 6: Test It
Read `references/testing.md` and run the real-use loop: two or three realistic prompts run via subagents where available, traces read rather than skimmed, one revise pass minimum. Both failure modes checked — did it work, and is the output actually good? Be honest about the evidence split: execution is testable now; triggering and the off-target near-miss are only provable once the skill has been installed on a platform and prompted in fresh chats — hand the user those prompts as the first step after the install.

### Step 7: Place and Hand Off
Place the folder where the user's skills live (see Where skills live below), bump the pack's version if there is one, and commit. Close with the **Decisions made** note and next steps: where the skill is picked up from, and the reminder that triggering can only be confirmed after it is installed (hand the user the test prompts). A skill that will run unattended or ship to other people gets the health check before it ships; nobody is there to correct it mid-run.

## Mode 2: Extract from This Chat
The highest-leverage mode. The user has been doing real work in this session and wants it captured as a skill.

1. **Read the chat as source material.** Identify the repeatable job, the sequence that worked, and — most valuably — the corrections the user made along the way. Corrections are where the real expertise lives; they're the gotchas section writing itself.
2. **Propose the skill shape without making them re-explain.** "Looks like the repeatable job here is [X], triggered when [Y]. Here's the shape I'd build — and these three corrections you made become the gotchas section." Confirm scope: is the skill the whole workflow or the piece that recurs?
3. **Run Steps 3–7 of Build mode**, pre-filled from the chat. Only ask what the session genuinely didn't answer.

If the chat is too thin to extract from, say so and fall back to Build mode — don't force an extraction from nothing.

## Mode 3: Diagnose and Improve
Something exists and isn't performing. **Diagnose before rewriting, and scope before touching anything** — a minor tweak and a full revamp are different investments, and misidentifying one as the other wastes time or produces an under-baked result.

0. **Resolve the bundle first.** A skill is a folder (see Where skills live). Read it in place. A `.skill` file someone sent is a zip — unpack it into a working folder (`unzip name.skill -d working/`) and place the result where it belongs. Installed copies on a platform are read-only mirrors of the source; the fix lands on the next pull or reinstall. If a copy is generated from another folder, fix the source and regenerate, never the copy.
1. **Read the skill without running it.** Whole bundle: SKILL.md, every reference, scripts. Note surprises — instructions that don't match the description, unreferenced files, external dependencies.
2. **Establish the failure bucket:**
   - **Doesn't trigger** → it's almost always the description. Fix the routing rule first; this is the cheapest, highest-yield repair.
   - **Triggers but executes badly** → instructions problem: too vague (agent improvises), too rigid (agent can't adapt), too much (agent drowns), or a self-containment break (references something outside the bundle).
   - **Works but the output misses the intention** → the hard one. Re-run Build Step 2's questions against what the skill currently produces; the gap between stated intent and actual output is the diagnosis. This may mean the skill needs re-scoping, not editing.
3. **Confirm scope with the user** — tweak or revamp — before editing. Then fix, re-test with the loop from `references/testing.md` (including the prompt that originally failed), bump the pack version if there is one, and commit. Keep the skill's name and folder unchanged — an improved skill replaces its old version on the next pull; a renamed one (`name-v2`) installs alongside it and splits the routing.

## Mode 4: Health Check
An honest quality and readiness read on any skill — run it before a skill ships to anyone but its builder, at the end of every improve pass, or whenever the user wants a straight answer to "is this actually good?". The bar scales with the audience: a skill only its builder triggers can carry a rough edge they know about; a skill that fires on a schedule or on a colleague's machine cannot.

Resolve the bundle the same way Mode 3 does (step 0), then read `references/health-check.md` and walk every check: description accuracy, trigger scope, surprise check, self-containment, functional, intention, quality bar, and evolution. Produce the readiness report in that file's format with a verdict — **ready** or **fix first** with a specific list.

---

## Where Skills Live
A skill is a folder with `SKILL.md` at its root. Where that folder goes depends on who should see it, and the user usually already knows; if not, ask once and remember the answer for the rest of the conversation.

| Home | Who sees it | How it is picked up |
|---|---|---|
| A skills folder inside one project (`.claude/skills/`, `.cursor/skills/`, `.agents/skills/` — whichever the tool reads) | Anyone working in that project | Automatically, on the next session |
| A personal or team plugin repo with marketplace manifests | Every project the user opens, on every platform that added the marketplace | A marketplace pull or reinstall |
| A `.skill` zip | Someone outside the user's own setup | They install the file |

A pack is a folder with `skills/`, optional `templates/` and `scripts/`, and a plugin manifest per platform that reads it. A skill is placed by putting its folder under the pack's `skills/`, bumping the version in every manifest of that pack, committing, and pushing. `.skill` zips exist only to hand a skill to someone else: `zip -r name.skill name/ -x "*.DS_Store"`.

A skill may assume the folder it is installed in and nothing else about the machine; declare any other assumption in the skill rather than bundling files from outside it.

Two checks before a commit, both learned from real installs:

- **Count the description.** Installers cap the frontmatter `description` at 1,024 characters and reject the skill over it. Verify the length now.
- **Verify the folder.** `SKILL.md` at the folder root, every reference pointed to, nothing that is not part of the skill: no working notes, no test outputs, no `.skill` builds.

## Platform Notes
- **Claude Code, Cursor, Codex**: subagents are available — run execution tests in parallel, each in a clean context. This is the honest test: the runner didn't write the skill.
- **Anything that runs a skill unattended** (a scheduled agent, a bot): no one is watching. Test it with subagents before it ships, and give it explicit failure paths for every service it depends on, because it cannot ask mid-run.

## The Standard This Skill Encodes
This skill encodes a current skill-building standard — current, not permanent. The eval findings it cites are point-in-time results from a young ecosystem and will be revised as the data matures. The user owns the standard for their own skills; when something here fights real use, note it in the project's `ENHANCEMENTS.md` rather than working around it. Prose inside a skill follows the Language section of `references/writing-standards.md`. A skill never redefines the character of the agent that runs it; that lives in the profile and project instructions.

## Gotchas
- The description is the routing rule; a body nobody reads is a smaller failure than a description that never fires or fires on everything. Test the near-miss.
- A skill that names another skill as a step is a chain; hand over the artefact (a row, a file) instead. The rule is Skills Never Call Skills, above.
- Manifests drift silently: a version bump in one of a pack's plugin files without the others leaves a platform on the old skill.
- Fenced templates inside a skill are output, not headings; do not Title Case or rewrite them.

## When Things Go Sideways
- **The job is too big for one skill and the user wants one anyway.** Build the orchestrator plus sibling skills, say why in one line, and record the split in the Decisions made note.
- **A test loop cannot run (no agent to run the prompts).** Ship with the health check only and mark the readiness report Untested; do not claim the loop ran.
- **The standard here contradicts a platform's rules.** The platform wins on that platform; write the exception in Platform Notes.

## A Note on Tone
This skill is for the user and the agents that run it. Match the reader's level. Terms like "frontmatter", "progressive disclosure", or "subagent" get a short plain-language gloss the first time they matter to a decision the user is making. Never let vocabulary become a gate on building a good skill.

## Reference Files
- **`references/architecture.md`** — bundle anatomy, progressive disclosure, the size ladder, coherent-unit scoping, the no-daisy-chain rule, self-containment audit, subagent orchestration. Read at Build Step 3, Extract step 3, and whenever size or splitting is in question.
- **`references/writing-standards.md`** — the evidence-backed writing standards: descriptions as routing rules, context economy, constitutional writing at skill scope, calibrating control, high-value patterns (gotchas, templates, checklists, validation loops), language rules. Read at Build Step 4 and during any Improve-mode rewrite.
- **`references/testing.md`** — the real-use test loop: prompt design, off-target near-misses, reading traces, the revise pass, when to add rigor. Read at Build Step 6 and Improve step 3.
- **`references/health-check.md`** — the quality and readiness checklist plus the readiness report format. Read for Mode 4, and before any skill ships to an audience beyond its builder.
