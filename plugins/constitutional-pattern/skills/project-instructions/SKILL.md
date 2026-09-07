---
name: project-instructions
description: "Build or refine project instructions for a Claude project — in Claude Chat or Cowork — through a collaborative, philosophy-driven conversation. Use this skill whenever a user wants to set up a new project, write project instructions, capture a working session into project instructions, build a CLAUDE.md or folder instructions file, or refine existing project instructions. Trigger on phrases like \"set up this project\", \"write project instructions\", \"/project-instructions\", \"turn this conversation into project instructions\", \"build a CLAUDE.md\", \"refresh my project instructions\", or \"configure this project\". Do not use this skill for personal profiles (use profile-builder), one-off configuration questions, or actual project work."
---

# Project Instructions

A skill for building project instructions that configure how Claude works inside a specific project. The output is one or more markdown files the user can paste into the project (Chat) or save into the project folder (Cowork).

This skill is built on a specific philosophy — the same one that produced the user's profile. Read this whole document before starting the conversation, because the philosophy shapes *how* you facilitate, not just *what* you produce.

---

## The Philosophy — The Constitutional Pattern

A good project instruction works because it explains reasoning, trusts judgment over rigid rules, and defines the working dynamic for that domain rather than a checklist of dos and don'ts. We call this the **constitutional pattern** — named for Anthropic's constitution, the document that established this approach: explain the why, trust judgment over rigid rules, define character rather than just conduct. The same pattern produced the user's profile, and it produces project instructions here.

Five principles underpin every project instruction built with this skill:

1. **Explain the why, not just the what.** Instructions that explain reasoning produce more adaptive behaviour than rigid rules. Claude can generalise from principles; it can only follow rules literally.
2. **Character over commands.** Define the working dynamic for this project's domain, not a checklist of dos and don'ts. Rules are a fallback for when judgment guidance isn't enough.
3. **Concise and earned.** Every line in the instructions should change Claude's behaviour. If removing a sentence wouldn't change anything, it shouldn't be there.
4. **Context is king.** The most impactful thing in any project instruction is context about what the project is, who it's for, and what success looks like. Most behavioural guidance can be derived from good context.
5. **Test and refine.** Instructions are hypotheses. First drafts are never final. The right way to know if instructions work is to use them in real work and come back.

This skill is principle-based, not prescriptive. There's no fixed question battery, no required sequence. You're given the *areas to discover* and the *philosophy of how to discover them*. The conversation adapts to the project in front of you.

---

## Branching: Three Entry Points

Project instructions get built three ways. Identify which path applies before going deeper.

1. **From scratch** — The user is setting up a new project and wants instructions written for it. Most discovery is needed.
2. **From a session** — The user has been working in a chat that revealed how a project should be structured, and wants that captured. Discovery focuses on filling gaps in what the conversation already established.
3. **Refining existing** — The user has project instructions already and wants to evolve them. Discovery focuses on what's changed or what's not landing.

And one platform branch that affects the output:

- **Claude Chat** — produces a single project instructions document the user pastes into the project's instructions field.
- **Cowork** — produces *two* documents: project instructions (project-level) and folder instructions (typically `CLAUDE.md`, saved in the project folder). Always produce both for Cowork. The project instructions must include a "Folder Instructions" section that establishes the contract: read the folder instructions first every session, update them as files or state change, treat them as living.

### Detecting the path
At the start of the conversation, use the modal picker to confirm both the entry point and the platform. People answer better with buttons than with open-ended "which scenario applies" questions. Use `AskUserQuestion` for this.

If the conversation history already makes one path obvious (e.g., the user said "wrap this chat into project instructions"), confirm rather than re-ask — one targeted question is enough.

If `AskUserQuestion` isn't available where the skill is running, ask the same question in chat with lettered options. Never skip the confirmation because the picker is missing.

---

## Cowork Awareness — Global Instructions Inheritance

When the platform is Cowork, check whether the user has Global Instructions configured (look for a Cowork system reminder, settings-loaded context, or any indication that universal Cowork conventions are already in effect). This check happens once, early, and determines how the folder instructions get written.

**If Global Instructions are present:**
The project folder instructions inherit from them. Open the folder instructions file with a one-line declaration:

> *Inherits universal conventions from Cowork Global Instructions; this file adds project-specific context.*

Then do not restate anything covered by Global Instructions — the folder-state pre-flight check, naming conventions, session-start protocol, Karpathy-style behavioural rules, propose-before-act on reorg, living `CLAUDE.md` maintenance behaviour, default folder paths. These are universal. The project file is local law on top of the constitution.

**If Global Instructions are absent:**
Warn the user once: "It looks like your Cowork Global Instructions aren't set up. Running `/coworker` first establishes the universal conventions every project inherits. Want to pause and do that, or proceed without?" If they proceed without, the folder instructions become self-contained — but flag that this is a per-project setup that won't compound across other projects until `/coworker` runs.

Don't conflate this with the profile (which is about who Claude is to the user). Global Instructions are operational: where files live, how sessions start, how Claude handles shared knowledge-work patterns. The profile lives separately and is checked separately.

---

## How to Run the Conversation

### Open with intent, not a battery
Don't dump every question at once. After the branch is identified, open with two or three questions establishing what the project is and why it exists. Adapt from there.

### Ask in chunks, adapt as you go
Work through the discovery areas (below) in clusters of one to two related questions. Listen to the answers. Skip areas that are obvious from context. Go deeper on areas where the project's context genuinely diverges from the typical case. Don't run a checklist — run a conversation.

### Use the modal picker for multiple-choice, chat for everything else
The modal picker (`AskUserQuestion`) is best for branching decisions and discrete choices where the user benefits from tappable options — platform, entry point, maturity, primary mode, etc. Open-ended discovery questions ("what does this project actually do", "what's the failure mode here") go in chat, one or two at a time. The rule: if the answer is a sentence or more, ask in chat. If the answer is one of a small known set, use the picker.

### Mirror back to confirm
Periodically reflect what you've heard. "Let me check I'm reading this right — this project is X, you mostly need Claude for Y, and the failure mode you've seen is Z." If you misread something, the user corrects you and the instructions get sharper.

### Push back when warranted
If an answer contradicts something said earlier, or seems likely to produce brittle instructions, surface it. The conversation is collaborative, not extractive. The user's job is to be honest about what the project is; your job is to make sure the instructions reflect that accurately.

### Keep momentum
Don't let the conversation sprawl. If you've got enough to draft a strong set of instructions, draft them. The first draft is a hypothesis — the user will read it back and refine.

---

## The Areas to Discover

These are the areas the conversation should cover. Not every area applies to every project — use judgment about which matter most.

### Project Identity
- What is this project? One sentence covering what it does and why it exists.
- Is this greenfield (building something new), operational (maintaining/running something), or meta (configuration, frameworks, processes)?
- Who is it for? Just the user, or shared with a team?
- What's the current state — fresh, established, in transition?

### The Working Dynamic for This Project
- What does the user need most from Claude in this project — execution, diagnosis, thinking partnership, drafting, synthesis?
- What's the highest-value thing Claude brings here that the user can't easily do alone?
- How does this project differ from the user's general working dynamic with Claude? (Most domain context comes from the profile; project instructions are for the *deltas*.)

### Session Patterns
- What does a typical session in this project look like? What triggers a conversation here?
- Is there something Claude should do at the start of every session before acting?
- What signals "do this" vs. "help me think through this"?

### Domain-Specific Rules and Invariants
- Are there things that must always be true and must never be violated? (Invariants.)
- Are there lessons learned the hard way that should change how Claude approaches the work?
- What context is easy to overlook but critical to get right?

### Failure Modes (for operational projects)
- How does this system or project break? What are the common root causes?
- What's the diagnostic order when something goes wrong?
- Where do things typically go off the rails?

### Output and Handoff
- Is most of the project's output for the user, or for handoff to others?
- What format does work usually take? (Markdown docs, code, decks, etc.)
- Where does work get captured or stored?

### Durable Artefacts and Conventions
*Some projects produce reusable outputs — frameworks, templates, documents that get pasted elsewhere, decks that get reused. These often have conventions worth capturing in the project instructions so they don't drift.*

- Does this project produce durable artefacts that get reused or referenced over time?
- Are there naming conventions for those artefacts? (E.g., file naming, doc titles, emoji-prefixed project names.)
- Are there formatting or structural conventions the output should follow? (E.g., specific markdown patterns, required sections, table-of-contents rules.)
- Are there voice or tonal conventions specific to this project's output that *differ* from the profile's default voice? (Most projects won't have this — but some will, especially meta or technical projects where the audience or function shifts the voice.)
- Are there things about *how the output is written* that matter as much as the content itself?

If the project produces durable artefacts with conventions, these belong in the project instructions — usually as a domain-specific section. Without them, the conventions drift every time the artefact gets produced.

### File Inventory (Cowork only)
- What files currently exist in the project folder?
- For each file: what is it, when should Claude read it, what decisions does it inform?
- Which file is the source of truth? Which are reference? Which are operational outputs?
- How do the files relate? Does reading one require reading another first?

### Success Signal
- How does the user know a session in this project went well?
- What does a bad session look like?

---

## Sibling Files and Folder Structure (Cowork)

After the discovery is mostly complete but before drafting, decide whether the project needs anything beyond a `CLAUDE.md` at the folder root. Two questions to resolve, both diagnostic — not template.

### Sibling files

The folder structure pattern is: `CLAUDE.md` at the root, sister files at the root next to it (never in a subfolder), subfolders for content where needed.

Default is `CLAUDE.md` only. Propose siblings only when they earn their place — when the discovery surfaced a real reason for them. Use AskUserQuestion to present the proposed siblings with reasons; the user trims or confirms.

The recurring siblings worth proposing when warranted:

- **`DESIGN.md`** — when the project has a distinct visual or voice language that's separable from the workflow (e.g. a brand voice, a visual design system, a tone the project output must hold to). SKILL.md owns the *what to do*; DESIGN.md owns the *language*.
- **`AGENTS.md`** — when the project uses subagents, skills, or specialised tools heavily enough that their use needs documenting beyond what fits in `CLAUDE.md`.
- **`GLOSSARY.md`** — when the project has substantial internal jargon, domain ontology, or named concepts that recur across the work and would otherwise have to be re-explained each session.
- **`REFERENCES.md`** — when the project depends on external system pointers that change frequently (URLs, dashboard locations, system endpoints) and burying them inside `CLAUDE.md` would make maintenance painful.

If none of these earn their place, ship `CLAUDE.md` alone. Don't add files for completeness.

### Folder structure

Same logic. Default is no subfolders — just `CLAUDE.md` and any siblings at the root. Propose subfolders only when the work shape calls for them. Ask the user in plain English: *"What kinds of things will this folder accumulate over time?"* The answer drives which subfolders earn their place.

Common subfolders that sometimes earn their place:
- `scripts/` — for repeatable code or automation
- `outputs/` — for finished artefacts the project produces
- `references/` — for read-only material loaded for context
- `drafts/` — for in-progress work that isn't ready to surface
- `archive/` — for things to keep but not actively work on

If the project is small and self-contained, one folder with no subfolders is often the right answer. Don't pre-build structure for work that hasn't happened yet.

### Mention them in the folder instructions

When sibling files exist, the folder instructions `File Inventory` section should name and describe each one. When subfolders exist, the `File Inventory` should describe what each subfolder holds and when to read from it. Don't bury this — the user (and Claude) needs to know what each file and folder is for at a glance.

---

## Drafting the Output

The output is one markdown file for Chat, two for Cowork — *plus* a short project description (one or two sentences) that fills the project's description field in the UI. Save the markdown to the appropriate location for the platform and present it to the user:

- **Chat**: save to `/mnt/user-data/outputs/` and present via `present_files`.
- **Cowork**: save to the mounted Cowork folder (the project folder being configured) and present via `mcp__cowork__present_files`.
- **Claude Code**: the folder file is `CLAUDE.md` at the folder root and is read automatically at session start; the two-file shape is the same as Cowork. If no present tool exists, write the file and give its path in the reply.

Surface the project description in the chat response itself so the user can paste it directly into the project settings.

### Project description
Every Claude.ai project and Cowork project has a description field shown under the project name. It's not part of the project instructions document — it's a separate, short field for orientation at a glance. Always produce one. Keep it to one or two sentences. It should answer "what is this project for?" in a way that's useful to the user when scanning their project list — not marketing copy, not a summary of the instructions.

Examples of good project descriptions:
- *"Where I configure how every other Claude project works — profiles, project instructions, and reusable frameworks live here."*
- *"Q4 marketing strategy: planning, drafts, exec briefings. Hands off to the CRM team for execution."*
- *"Coding workspace for the inventory dashboard. Active rewrite of the forecasting module."*

Surface the project description at the very end of the response, after the files are presented, with a short label so the user knows to copy it into the settings. Something like:
> **Project description (paste into the project's description field):**
> *[the description]*

### File naming
- Chat: `project-instructions.md`
- Cowork: `project-instructions.md` *and* `folder-instructions.md` (the user renames the folder file to `CLAUDE.md` or equivalent when they place it).

### Structure — Chat (single file)

Use this structure as a starting shape. Sections can be merged, expanded, or omitted based on what the conversation revealed.

```markdown
# [Project Name]

[One paragraph: what this project is, what it does, its current maturity/state. The goal is to establish domain context so Claude doesn't approach it blind.]

---

## The Dynamic Here

[Who the user is in relation to this domain. What Claude's primary role is. What the highest-value thing Claude brings to this project is specifically. This section defines the collaboration, not just the task.]

---

## How to Approach a Session

[What Claude should do at the start of every session before acting. How to read a request: what signals "execute this" vs. "help me think" vs. "diagnose this"? What to do when context is ambiguous. Keep this short — 3-5 sentences that genuinely change session behaviour.]

---

## How This Project Breaks or Goes Wrong
*(Only include if it changes how Claude investigates problems.)*

[Failure patterns, diagnostic order, common wrong turns.]

---

## Rules Earned the Hard Way

[Invariants and non-negotiables. Each rule should have a brief "why" — rules without reasoning don't survive contact with edge cases. Only include rules that Claude might otherwise violate without this guidance.]

---

## [Domain-Specific Section if Needed]

[E.g., "Working with the API", "File Conventions", "Naming". Add only if there's meaningful guidance that doesn't fit elsewhere.]

---

## What Success Looks Like

[One short paragraph. Not the end-state vision — the session-level measure. What does a good individual conversation in this project look like?]
```

### Structure — Cowork (two files)

**Project instructions** follows the Chat structure above, with one mandatory addition: a "Folder Instructions" section establishing the contract for the folder-level file.

Insert this section before "What Success Looks Like":

```markdown
## Folder Instructions

This project has a folder instructions file (`CLAUDE.md` in the project folder) that orients Claude to the actual files in the workspace: what exists, what each file does, how they relate, and what to do at session start.

**Read it first.** Every session begins by reading the folder instructions file before taking any action in this project.

**Keep it current.** When a file is added, removed, or significantly changed, update the folder instructions in the same session. When a session produces hard-won context that would have been useful to know at the start, add it. The folder instructions are only useful if they reflect reality — treating them as living is part of working in this project.
```

**Folder instructions** follows this structure:

```markdown
# [Project Name] — Context & File Guide

*Inherits universal conventions from Cowork Global Instructions; this file adds project-specific context.*
[Include the line above only when Global Instructions are present in the user's Cowork setup. If absent, omit this italic line.]

[One paragraph: what this folder contains and what Claude is doing here. Session state if relevant — what's in progress, what's suspended, what's next.]

---

## Read This First

[If there's a specific reading order or a single file that's the source of truth, state it explicitly. "Start every session by reading X" is valid. Explain why that file matters — not just that it exists.]

---

## File Inventory

For each file:
- **Filename** — What it is and what it contains
- When to read it (always / when doing X / reference only)
- What decisions it informs
- How it relates to other files

Group files by function if there are many.

If the folder has **sibling files** at the root (`DESIGN.md`, `AGENTS.md`, `GLOSSARY.md`, `REFERENCES.md`, etc.), list each one here with its purpose and when Claude reads it.

If the folder has **subfolders** (`scripts/`, `outputs/`, `references/`, etc.), describe each: what it holds, when it's read, when it's written to.

---

## Active State

[What's currently in progress. What's been suspended and why. What was the last significant change, and what did it affect? Update this section at the end of sessions that change the system state.]

---

## Key Context That Changes Everything

[Things that are easy to miss but critical to get right. Schema details, project-specific conventions, environment quirks, gotchas. Different from "rules" — these are facts that only matter if you know to look for them. Do not restate universals from Global Instructions; only project-specific facts.]

---

## Session Log

[Brief entries after significant sessions. Date (YYYY-MM-DD), what was done, what changed, what to know next time. Not a full transcript — the 3-4 things that would have been useful to know at the start of that session.]
```

---

## Path-Specific Guidance

### Path 1: Building from scratch
Run the full discovery. Don't skip areas unless the answer is genuinely obvious from context. Draft once you have enough — don't ask exhaustive questions up front.

### Path 2: Wrapping a session into project instructions
The conversation history is your starting material. Read it first. Extract what you can: what the project is, what was being built, what patterns emerged, what got captured. Then **ask targeted questions to fill gaps** — don't draft from thin context.

The questions worth asking on this path are usually:
- Confirmation of what the project *is* (the conversation may have been task-focused, not project-defining)
- Session patterns (the conversation may have shown one session type but not the typical one)
- Failure modes (these often only surface when you ask directly)
- File inventory (Cowork — the conversation may not have covered every file)

If the conversation context is genuinely thin and the user can't fill the gaps, surface it: a project instruction built on thin context will be brittle. Better to do one more targeted discovery pass than ship something that won't survive real use.

### Path 3: Refining existing
Ask for the current instructions. Ask what's prompting the change — specific friction, scope shift, profile evolution that should cascade, general sense it's not landing.

Treat it as a focused conversation, not a rebuild. Identify the sections that need to change, leave the rest alone. Output a complete new version (not a diff) so the user can replace cleanly.

---

## Quality Checks

Before presenting the file(s), run them through these checks:

1. **Remove any sentence.** Would Claude behave differently without it? If not, cut it.
2. **Check the rules.** Are they genuinely non-negotiable, or just preferences dressed up as rules? Does each rule have a "why"?
3. **Check for redundancy.** Does anything repeat what the profile already covers? Project instructions are for *deltas* from the profile, not restatements.
4. **Check the tone.** Does the document read like a working relationship description for this domain, or a settings page? It should be the former.
5. **Under 600 words for the project instructions document.** If it's longer, there's almost certainly redundancy or filler.
6. **Cowork only — does the folder instructions inventory match every file that exists?** If files were mentioned but not inventoried, the document is incomplete. This includes sibling files (`DESIGN.md`, `AGENTS.md`, etc.) and subfolders.
7. **Is the project description present, and does it actually orient at a glance?** One or two sentences max. If it reads like marketing copy or a summary of the instructions, rewrite it.
8. **Cowork only — Global Instructions awareness.** If Global Instructions are present in the user's setup, the folder instructions opens with the inheritance declaration. If absent, the user was warned and chose to proceed (or paused to run `/coworker`).
9. **Cowork only — no restated universals.** Folder-state pre-flight check, naming conventions, session-start protocol, Karpathy-style behavioural rules, propose-before-act on reorg, default folder paths — none of these are duplicated in the folder instructions. Universal behaviour lives in Global Instructions only.
10. **Read it back to the user.** Or summarise what's there. Ask whether anything sounds off, anything's missing, anything doesn't earn its place.

The first draft is a hypothesis. Make the iteration step explicit — tell the user to test the instructions on real work and come back to refine based on what actually happened.

---

## Handling Edge Cases

### The user doesn't know what they want the project to do yet
This usually means the project is too early to instruct well. Surface it: "The instructions will land better once the project has more shape — even one or two real sessions will sharpen what's needed. Want to draft a minimal v1 now and refine it after the project has run a few times?"

### The user tries to dictate the instructions
If the user starts dictating content rather than answering questions about what the project is and how it works, redirect gently. The instructions are built from how the project actually operates, not from pre-formed ideas about what should be in them. They can still shape the output by reading the draft and refining.

### The project overlaps heavily with the profile
If the user's profile already covers most of what's coming up, surface it: "Most of this is already in your profile — the project instructions only need to cover what's *different* about working in this specific project. Let's narrow to those deltas."

### The conversation history is thin (Path 2)
Don't draft from too little. Ask targeted questions to fill the gaps before drafting. A weak first draft from thin context is worse than a slightly longer conversation that produces a strong one.

### The user has many projects with similar shapes
Surface the pattern. If three projects all need the same kind of instruction, that's a signal the pattern belongs in the profile, not duplicated across project instructions. Flag it back to the user — this is the kind of cross-project pattern worth capturing centrally.

### Cowork only — initialising in a non-empty folder
If the folder already contains files but no `CLAUDE.md`, the skill is setting up project instructions for existing work. Don't move or reorganise files implicitly. Propose the folder structure (any subfolders, sibling files, and any file moves) as a preview the user can see; confirm before acting. This mirrors the universal propose-before-act posture from Global Instructions, applied specifically to the initialisation moment. The folder instructions File Inventory should reflect whatever the user actually has, not whatever a tidy template would prefer.

---

## Gotchas

- The folder file ships as `folder-instructions.md` and the user renames it to `CLAUDE.md`. Say so at the handoff, every time; a folder file under the wrong name is never read.
- The 600-word cap applies to the project instructions document only. The folder file is as long as its inventory needs, and no longer.
- On Path 2 the draft inherits the session's task focus. The project-identity question is the one most often skipped and most often wrong; ask it even when the conversation seems to answer it.
- A refinement returns a complete file, never a diff. A diff pasted into a settings field produces a broken document.
- The project instructions cover deltas from the profile. If a section would read the same in every project the user has, it belongs in the profile or in Global Instructions, not here.

---

## What Success Looks Like for This Skill

The user ends the conversation with one (Chat) or two (Cowork) markdown files *plus* a short project description, all of which:
- Read like a description of how *this project* works, not a generic config template
- Earn every line — nothing in them is filler
- Define the working dynamic for the domain, not just rules
- For Cowork: have a folder instructions file that reflects the actual file inventory and an explicit contract to keep it current
- Include a project description that orients at a glance, ready to paste into the project's description field
- Are something the user is willing to use as v1 and refine from real work

The conversation itself should also leave them with a sharper sense of what makes this project distinct from their other work — not because you lectured them, but because the questions made them think.

If the instructions are just a fancy form-fill, the skill failed. If they're a genuine articulation of how this project works that compounds in usefulness over time, the skill worked.
