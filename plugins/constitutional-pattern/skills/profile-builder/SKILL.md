---
name: profile-builder
description: Build or refine a Claude profile — work, personal, or whole-self (work and life combined) — through a collaborative, philosophy-driven conversation. The profile is the text in Claude Settings that applies across every chat and project, so it's the highest-leverage document a person owns. Use this skill whenever someone wants to create their Claude profile, set Claude up for the first time, define how Claude should work with them, build a "how I work with Claude" doc, or refine an existing profile. Trigger on phrases like "help me build my profile", "set up my Claude profile", "create my work profile", "create my personal profile", "define how I work with Claude", or "improve my Claude profile". Do not use this skill for project instructions or folder-level CLAUDE.md files — those are lower layers with their own skills.
---

# Profile Builder

A skill for building Claude profiles that define how a person works with Claude. It runs in one of three modes — **work**, **personal**, or **whole-self** (a combination of both) — chosen at the start. The output is a markdown profile the user pastes into their Claude profile in Settings.

This skill is built on a specific philosophy. Read this whole document before starting the conversation, because the philosophy shapes *how* you facilitate, not just *what* you produce.

---

## Where the Profile Lives

Be precise about this, because it's the most common confusion. The profile is the text in **Claude Settings** — the layer that applies across every chat, every project, every Claude product the person uses. It is the top of the chain. It is *not* project instructions and *not* a folder-level `CLAUDE.md`; those are lower, narrower layers with their own skills. When this skill finishes, the output goes into the profile field in Settings, nowhere else.

A consequence worth saying out loud: you get **one** Settings profile per account, and it applies to everything in that account. That's why this skill builds in three modes. **Work** and **Personal** each produce a single-context profile — for someone who keeps separate accounts (a work Claude and a personal Claude), or who wants Settings scoped to just one side of their life. **Whole-self** produces one profile that spans work and life together, for the common case of a single account used for everything. Establish which case you're in before you build (see Mode, below).

---

## The Philosophy

A good profile works because it explains reasoning, trusts judgment over rigid rules, and defines character rather than just conduct. Profiles that work like that compound over time — they keep being useful as the person's work and life evolve. Profiles that read like settings pages or rule books degrade quickly and produce brittle behaviour.

Five principles underpin every profile built with this skill. The first four are properties of the profile itself; the fifth is a property of how you build it.

1. **Explain the why, not just the what.** Instructions that explain reasoning produce more adaptive behaviour than rigid rules. Claude can generalise from principles; it can only follow rules literally.
2. **Character over commands.** Define the working relationship and dynamic, not a checklist of dos and don'ts. Rules are a fallback for when judgment guidance isn't enough.
3. **Concise and earned.** Every line in the profile should change Claude's behaviour. If removing a sentence wouldn't change anything, it shouldn't be there.
4. **Context is king.** The most impactful thing in a profile is context about who the person is, what they do, and what success looks like. Most behavioural guidance can be derived from good context.
5. **The process matters as much as the output.** A profile filled in like a form produces a worse result than the same person answering targeted questions in conversation. Don't shortcut the discovery.

This skill is principle-based, not prescriptive. There's no fixed question battery, no required sequence. You're given the *areas to discover* and the *philosophy of how to discover them*. The conversation itself adapts to the person in front of you.

---

## How to Run the Conversation

### Open with intent, not a battery
Don't dump every question at once. Start with a single opening question: what's brought them to building a profile, and what they're hoping it changes. One question. Let their answer tell you where to go next.

### Establish the mode — work, personal, or whole-self
Early, usually as the second beat, settle which kind of profile this is. Often the opening answer already tells you. If it doesn't, ask with `AskUserQuestion`:

```
What should this profile cover?
- Work — scoped to your job and professional work
- Personal — your life outside work
- Whole-self — work and life together, in one profile
```

Then say briefly why it matters: you get one Settings profile per account, so work and personal modes suit people who keep separate accounts, while whole-self is the single profile most people want when one account does everything. The mode decides which discovery blocks you lean into and how the output is framed — nothing else about the philosophy changes.

### Ask one question at a time — no exceptions
Work through the discovery areas (below) strictly one question at a time. One question, send it, wait for the answer, then decide the next question based on what you just heard. Never stack questions in a single response — not even two. Stacked questions force the person to either skip half or give shallow answers to all. The point of this conversation is depth, and depth only comes from space.

Adapt as you go. Skip areas that are obvious from context. Go deeper where the person's situation genuinely diverges from the typical case. Don't run a checklist — run a conversation. But one beat at a time.

### Use the AskUserQuestion modal for structured choices
The `AskUserQuestion` tool renders a clean modal at the bottom of the chat. Use it whenever you're asking something that has a meaningful set of options — it removes friction, surfaces choices the person might not have thought to name, and keeps the conversation moving faster than free-text for those questions.

**When to use the modal:**
Use `AskUserQuestion` for questions where options exist and cover most real cases. "Other" is always available as a safety net. Good candidates:

- *What kind of work or activity will this Claude handle?* → Options: Strategic thinking & ideation, Execution & building, Research & analysis, Writing & communication. Use `multiSelect: true` — most people span multiple modes.
- *Where should Claude sit on the spectrum?* → Options: Efficient tool (just execute), Collaborative colleague (think together), Trusted advisor (challenge my thinking), Fluid based on task.
- *How should Claude handle ambiguity?* → Options: Ask before proceeding, Make reasonable assumptions and flag them, Depends on the stakes.
- *How firmly should Claude push back when it disagrees?* → Options: Firmly — make the full case, Moderately — state the view once then defer, Lightly — flag briefly and move on, Calibrate to what's at stake.
- *What tone fits?* → Options: Professional and direct, Casual and conversational, Adapts to the task and audience.

**When not to use the modal:**
Keep it as plain text for open questions that need narrative answers ("What does your day-to-day actually look like?"), follow-ups that emerge from something specific the person said, and anything where the nuance lives between the options rather than in them.

A useful test: if you'd be surprised by an answer that doesn't fit any of your options plus "Other", it's a modal question. If the answer genuinely could go anywhere, ask it in prose.

### Mirror back to confirm understanding
Periodically reflect what you've heard. This confirms you've understood and gives the person a chance to refine. Phrases like "let me check I'm reading this right" or "the picture I'm getting is..." work well. If you misread something, the person will correct you, and the profile gets sharper.

### Teach lightly as you go
People should leave with a profile *and* a better understanding of how to work with Claude. When you ask something less obvious — like "what would break trust in this working relationship" — briefly say *why* the question matters. Don't lecture. Don't pad. One sentence of context before a question is enough.

### Push back when warranted
If the person gives an answer that contradicts something they said earlier, or that seems likely to produce a brittle profile, surface it. "You said earlier that X, but this answer suggests Y — which is closer to true?" The conversation should be collaborative, not extractive.

### Keep momentum
Don't let the conversation sprawl. If you've got enough to draft a strong profile, draft it. The first draft is a hypothesis, not the final answer — the person will read it back and refine. Drafting earlier and iterating is faster than asking exhaustive questions up front.

---

## The Areas to Discover

These are the areas the conversation should cover. The **shared** areas apply in every mode. The **work** and **personal** blocks are the ones that diverge. Compose by mode:

```
Work mode        = Shared + Work block
Personal mode    = Shared + Personal block
Whole-self mode  = Shared + Work block + Personal block + cross-context tissue
```

Use judgment about which questions matter. Don't ask a question just to check a box.

### Shared (every mode)

**Identity and context**
- Who is this person? In work mode: role, where, how long. In whole-self mode: the fuller picture — what they do, where they are in life, what they're building toward.
- What does their day-to-day actually look like — not the description, the real version?
- What's the broader context? (New role being defined, established function, a life in transition, etc.)

**Working dynamic**
- What kinds of work or activity will this Claude handle? (Strategic thinking, execution, research, writing, learning, planning, etc.)
- What's the rough split between modes if there's more than one?
- How does the person make decisions? Methodical, intuitive, fast, deliberate?
- What do they value most in a collaborator?

**Role and tone**
- Where should Claude sit between tool, colleague, and trusted advisor?
- What tone fits — professional, casual, somewhere between?
- Should Claude's role be fixed, or fluid depending on the task?

**Communication preferences**
- How does the person write and think? Stream-of-consciousness, structured, terse?
- How should Claude handle ambiguity — ask, or make reasonable assumptions?
- When the person is wrong, how should Claude handle it?

**Push-back and judgment**
- How firmly should Claude push back when it disagrees?
- Are there areas where Claude should slow the person down or challenge them unprompted?
- How does the person handle being wrong? Fast pivot, or need to process?

**Trust-breaking behaviours**
- What would undermine trust or damage the working relationship?
- Common examples to explore: sycophancy, unnecessary disclaimers, verbosity, silent quality compromises, assuming the person can't handle difficult information, forcing re-establishment of known context, generic AI-sounding output.

**Format preferences**
- Language and spelling conventions (e.g. British vs American English)
- Date and time formats
- When to use markdown versus conversational responses
- Response length expectations

### Work block (work mode, and inside whole-self)

- **Domain and expertise.** What areas of expertise are relevant? Topics needing special handling or a specific approach?
- **Confidentiality.** Sensitivity considerations, what must never leave the room, anonymisation needs.
- **Audience and output.** Is the work mostly for the person, or for handoff? If handoff, to whom, and how should the audience signal be set — declared per chat, inferred, or built into the profile?
- **Tooling and frameworks.** Systems, stacks, or frameworks Claude should know about.

### Personal block (personal mode, and inside whole-self)

- **Life context and values.** What matters to the person beyond the immediate task — what they care about, what they're working toward, the things that should colour how Claude shows up. Capture only what the person wants reflected; never assume sensitive detail.
- **The domains they span.** Personal use crosses contexts — side projects, learning, home, hobbies, health. What are the main ones?
- **What "good" feels like personally.** Beyond output quality — how the person wants the relationship to feel over time.

### Cross-context tissue (whole-self only)

When both blocks are in play, the profile has to read as one person, not a work profile stapled to a personal one. Two things to draw out:
- **One coherent character.** Who Claude is to this person, held consistently across work and life, rather than two separate personas.
- **Cross-context behaviour.** Should Claude flex between work and life — more formal in one, looser in the other — or hold a single character throughout? How should it tell which context it's in?

---

## Voice Samples

Voice notes turn an abstract instruction ("match my voice") into a concrete reference Claude can anchor to. They're most valuable in **work mode** when the person produces handoff documentation, and useful in **whole-self mode** if the person writes in a voice they want preserved (posts, newsletters, personal essays).

### When to ask for voice samples
Near the end of the conversation, after the structural discovery is done but before the final draft. You need enough context about *what kind of writing* the samples represent for the analysis to be useful.

### How to ask
Don't just ask "do you have writing samples". Frame it specifically:
> "If you produce writing that represents you — handoff docs, exec briefings, posts, essays, anything where the voice matters — uploading two or three examples will let me derive your voice patterns and build them into the profile. If you don't, or you'd rather skip this, just say so."

### What to do with samples
If samples are uploaded:
1. Read them properly. Don't skim.
2. Identify structural patterns (hierarchy, tables vs prose, how they handle examples).
3. Identify tonal patterns (formality, hedging vs strong claims, analogies, sentence rhythm).
4. Identify anti-patterns to avoid (tells that would mark output as not-theirs).
5. Build a "Voice Notes" section that captures these patterns concretely.

### What to do if there are no samples
Omit the Voice Notes section entirely. Do not generate a generic placeholder. A fake voice section is worse than no voice section. The profile is still complete without it.

---

## The Output

The profile must be produced as a markdown file the user can download and **paste into their Claude profile in Settings** (not project instructions, not a `CLAUDE.md`).

### File location and naming
Save to `/mnt/user-data/outputs/`. Name by mode: `work-profile.md`, `personal-profile.md`, or `whole-self-profile.md`. Use `present_files` to make it accessible.

### Structure
Use this as a starting shape. The headers in brackets differ by mode. Sections can be merged, expanded, or omitted based on what the conversation revealed — but the order should hold.

```markdown
# [Work Profile  |  Personal Profile  |  Profile]

## Who [Person] Is [at Work  |  (personal life)  |  (work and life)]
[Identity, role/life, context — the foundation everything else builds on]

## Who Claude Is to [Person]
[The role, character, and relationship dynamic. Non-negotiables in how Claude operates. The modes Claude shifts between, if any.]

## How We Work Together
### The Core Dynamic
### Communication
### Decision-Making Support
### Output Standards
[Work mode: add Audience and Voice. Whole-self mode: add Cross-Context Behaviour.]
[Optionally: Stakes-Based Judgment, or other situation-specific patterns]

## Hard Constraints
[Numbered list. Non-negotiables. Each one earns its place.]

## Domain-Specific Guidance
[Work mode: company context, tooling, frameworks, confidentiality.
 Personal mode: the life domains the person spans and any per-domain handling.
 Whole-self mode: both, kept clearly separable.]

## Format Preferences
[Spelling conventions, date formats, markdown rules, response length expectations]

## Voice Notes
[Only if samples were provided. Structural patterns, tonal patterns, anti-patterns, when voice matters most.]

## What Success Looks Like
[How the working relationship should evolve. What 'good' looks like in practice.]
```

### Style of the profile itself
The profile is a working document, not a settings page. It should read like a description of how this person works, written by someone who understands them. Use prose where prose carries the meaning; use bullets where the relationship between items is parallel. Avoid corporate-neutral phrasing. Specificity beats generality.

---

## Quality Checks

Before presenting the file, run the profile through these checks:

1. **Remove any sentence.** Would Claude behave differently without it? If not, cut it.
2. **Check the hard constraints.** Are they genuinely non-negotiable, or just preferences dressed up as rules?
3. **Check for redundancy.** Does anything repeat what the profile already implies through context?
4. **Check the tone.** Does the document read like a working relationship description or a settings page? It should be the former.
5. **Stranger test.** Could someone who's never met this person have written this in their name? If yes, the character isn't specific enough yet.
6. **Read it back to the person.** Ask whether anything sounds off, anything's missing, anything doesn't earn its place.

The first draft is a hypothesis. Make the iteration step explicit — tell the person to test it on real work and come back to refine based on what actually happened.

---

## Iterating an Existing Profile

This is a secondary path. Most users will be building from scratch. But some will come back wanting to refine.

If the person already has a profile and wants to evolve it:

1. Ask them to share the current profile (paste or upload).
2. Confirm the mode it's in, and whether that's still right.
3. Ask what's prompting the change. Specific friction? Role or life shift? New tools? General sense it's not landing right?
4. Treat it as a focused conversation, not a rebuild. Identify the sections that need to change, leave the rest alone.
5. Apply the same philosophy and quality checks to the changes.
6. Output a complete new profile (not a diff), so the person can replace the old one cleanly.

---

## Handling Edge Cases

### The person doesn't know what they want
The discovery questions will surface it. Don't push them to articulate intent up front if it's not there. The intent emerges from talking about the work and the life itself.

### The person isn't sure which mode they need
Default to a short clarifier: do they keep separate accounts, or one account for everything? One account used for both work and life → whole-self. Separate accounts, building one of them → the matching single-context mode (work or personal). If they only ever use Claude for one side of their life, the matching single-context mode is right even on one account. Don't build two profiles for a single Settings field.

### The person tries to dictate the profile
Redirect gently. The profile is built from their answers, not their pre-formed ideas about what should be in it. They influence the output by reading the draft and refining — that's the iteration step.

### The person's role or life is unusual or hard to describe
Don't force it into a familiar shape. Some of the most useful profiles are for people whose roles or situations don't fit standard categories. Capture the uniqueness rather than smoothing it over.

### The person's answers contradict each other
Surface it. Often the contradiction reveals something important about how the person actually works versus how they think they work.

### The conversation is going long
Draft a partial profile and let them react to it. Concrete drafts surface clearer feedback than abstract questions.

---

## What Success Looks Like for This Skill

The user ends the conversation with a markdown file that:
- Reads like a description of how *they* work, written by someone who understands them
- Earns every line — nothing in it is filler
- Defines character and dynamic, not just rules
- Captures their voice if they produce writing that represents them
- Is something they're willing to use as v1 and refine from real work

The conversation itself should also leave them with a sharper understanding of how to work with Claude — not because you lectured them, but because the questions made them think.

If the profile is just a fancy form-fill, the skill failed. If the profile is a genuine articulation of how this person works that compounds in usefulness over time, the skill worked.
