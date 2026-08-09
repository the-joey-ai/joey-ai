---
name: my-design
description: "Create or evolve Joey's master DESIGN.md — his personal design signature, kept at ~/Claude/my-design/DESIGN.md and derived into every project he builds. Use when he wants to define or record his design taste, start his master design file, or process its harvest inbox after a project — “set up my DESIGN.md”, “what's my design identity”, “add this to my design file”, “I want my things to look like they came from the same person”. Also use when an old project design doc was really his taste and should become the master. Not for designing one specific project's look, which /vibe:new-project derives from the master, and not for reviewing or critiquing an interface that already exists."
---

# My Design

The master `DESIGN.md` is the reason a second project looks like it came from the same hands as the first. This skill starts it, and grows it.

## Why this file is one file, not per-project

Taste shows up in everything Joey makes, it sharpens with each build, and it is what makes a set of projects feel like a considered set rather than five unrelated things. So the master lives in one place — `~/Claude/my-design/DESIGN.md` — and each project *derives* from it rather than inventing its own look.

The alternative fails in a way worth naming, because it is the common one: a design doc written for a first project gets tailored as it goes, and by the third project there are three diverging documents and no signature. The master exists so learning accumulates in one place.

## Work out which mode you're in, then load its guide

Look for `~/Claude/my-design/DESIGN.md`.

- **No file** → first run. **Read `references/first-run-interview.md`** and run the interview it describes, then write the file per the rules below. Creating the folder for the first time: `git init -b main` it and create the private repo (`gh repo create the-joey-ai/my-design --private --source . --push` after the first commit) — the master follows the same rule as everything else: it lives on GitHub, so cloud sessions and other machines can reach it.
- **File exists** → evolve. **Read `references/evolve-mode.md`** and work through it: the harvest inbox, whatever Joey came with, and (occasionally) a tightening pass. Push when done.

## Writing the file

Use `../../templates/DESIGN-master.md`, following the instantiation contract in `../../templates/README.md` (fill, strip guidance, keep plain comments, delete unused stanzas, then run `../../scripts/verify-doc.sh` on the result).

Three things to get right, in either mode:

**Write values, not vibes.** "Warm off-white, `#F8F4EF`, never pure white" is a rule that can be followed and checked. "Warm, minimal aesthetic" is not. Where Joey doesn't know a value, say what you'd pick and why, and let him accept or change it — a concrete default he can react to beats an open question he can't answer.

**Leave Execution notes empty unless they have real specifics.** That section is for platform mechanics — code, component patterns, exact classes. On day one there usually aren't any, and an empty section is correct rather than incomplete; delete the template's `{{platform}}` stanza and leave a line saying the section fills on the first real build.

**The Do/Don't table is the most valuable thing in the file.** It is what becomes each project's verification checklist, so every row should be settleable by looking at a screen. If a row can't be checked, rewrite it until it can.

## Boundaries

- **This skill never writes a project's `DESIGN.md`.** Deriving the master into a project is `/vibe:new-project`'s job, and doing it here would create the divergence this file exists to prevent. If Joey starts describing the thing he's building, that's the signal — take the taste from what he said, and tell him the project design comes next.
- **Don't design for him.** His taste, written down clearly. Offer defaults where he's stuck, and say when you think something will fight him, but the file records his answer.

## What to know going in

- **A master that's never derived from is decoration.** After a first run, say plainly what happens next: the next project picks this up automatically.
- **Beware the design doc that's really a spec.** If sections start describing what a thing *does* rather than how it *looks*, that content belongs in `REQUIREMENTS.md` or `ARCHITECTURE.md` in the project. Move it rather than hosting it here.
- **Platform-specific values buried in the Signature are the main way derivation goes wrong.** A pixel spacing scale or a SwiftUI modifier in the Signature will get lifted into a web project where it means nothing. When something only makes sense on one platform, it goes in Execution notes even when it feels like taste.
- **Existing raw material is better than a blank page.** The Joey browser's `docs/DESIGN.md` (its §11 personality contract especially) and the my-substack card template are real records of Joey's taste — offer to mine them on a first run rather than starting cold.
