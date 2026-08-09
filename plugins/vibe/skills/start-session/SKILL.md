---
name: start-session
description: "Open a working session on a vibe project — orient, verify, aim. Reads the project's documents and says plainly where things stand, checks the documents still tell the truth about the code, then sets today's target: continuing the current phase, or picking what's next and writing a fresh SPEC.md for it. Use at the start of any session on a project that has a vibe CLAUDE.md, and whenever Joey says “where were we”, “what was I doing on this”, “let's keep going on <project>”, “pick this back up”, or invokes the command. Not for starting a brand-new project, which is /vibe:new-project, and not a gate — if he already knows what he wants to do, orient briefly and get out of the way."
---

# Start Session

Three jobs, in order: work out where the project actually stands, confirm the documents aren't lying about it, and set a target for today. Then get out of the way.

Keep the whole thing short. This is the opening of a working session, not a status meeting.

## Orient

Read, in this order: the newest entry in `CLAUDE.md`'s session log, `SPEC.md`, then `ENHANCEMENTS.md`'s "Next up". Read `REQUIREMENTS.md`'s known limitations if the project has any. Skim `ARCHITECTURE.md` only if you're about to touch structure.

Then say where things stand in **two or three sentences, in plain language**. Concretely, not as a document summary:

> Last session got the upload form working. The current phase is the vendor list page — about half done; the search box filters but sorting is still fake data. Next unchecked step is wiring the sort.

Never paste document contents back. Joey wrote them, or watched them being written; what he needs is the synthesis he'd otherwise have to do himself after two weeks away.

## Verify

The documents describe reality, and reality moves — sometimes without the documents. Check the cheap things now, because drift is only harmful when it goes unnoticed and gets built on.

1. **Do the checked steps in `SPEC.md` actually exist?** Sample two or three and look at the code. Checkmarks are written at the end of long sessions, and they are the single most common thing to be wrong. Trust the code.
2. **Is there uncommitted work from last time?** `git status`. If there is, the last session didn't wrap — surface what's there, work out whether it's finished or abandoned, and get it committed or reverted before anything new. Then **pull**: cloud sessions and other machines push too, and building behind the remote is how two sessions' changes become one confusing diff.
3. **Did automation touch the project?** Several projects have scheduled tasks that commit (the iptv reconcile writes daily). If the log shows commits since the last session entry, fold what they did into the orientation.

When something has drifted, fix the document now and say in one line what was off. Drift isn't a failure — it's the normal cost of building faster than you document. Fixing it at the start of a session costs a minute; discovering it three phases later costs a rebuild.

## Aim

Three situations. Handle whichever is true.

**A phase is mid-flight.** Confirm he's continuing, restate what done means for this phase in one line, and start on the next unchecked step. Most sessions are this one.

**The phase is finished, or there's no `SPEC.md` at all.** Pick what's next, then write the spec:

1. Offer what's genuinely next — from `ENHANCEMENTS.md`'s "Next up" if it exists, from `REQUIREMENTS.md`'s v1 list if it doesn't. Two or three real options with what each gets him, not a menu of everything.
2. **Archive the finished spec before overwriting it.** Copy the whole of the old `SPEC.md` into `docs/spec-history.md` inside the project, under a dated heading, **at the top of the file** — newest first. Create the file if it doesn't exist. This is what makes it safe to throw the current spec away.
3. Write a fresh `SPEC.md` from `../../templates/SPEC.md`, per the instantiation contract in `../../templates/README.md`, for the new phase: the goal, what done means in observable terms, ordered steps small enough that this session moves several, and how it'll be verified.

**He arrives with something specific.** "I need X working before the weekend." Don't route around the system and don't make him wait for it either — shape the request into a phase: goal, what done means, steps, in `SPEC.md`, then build. It takes two minutes and it means the work is recoverable next week.

**If a spec for an unfinished phase is already there, archive it first** — same move as step 2 — and note in the new spec what got set aside and why. Overwriting a live spec is the one genuinely irreversible thing in this system. If the interrupted phase was close to done, say so and offer to finish it first; a phase abandoned at ninety percent is worth two more minutes before pivoting.

## Then build

You're done when the target is set and `SPEC.md` reflects it. The session proceeds as ordinary work under the project's `CLAUDE.md` — which means: anything cut or deferred goes into `ENHANCEMENTS.md` when it happens rather than at the end, nothing is called done without being run, and anything visual gets the `DESIGN.md` verification checklist before "done" is said.

## If the project has no vibe documents

Say what's missing and offer the honest choice:

- **Genuinely new work** → `/vibe:new-project`.
- **An existing project worth bringing in** → offer an adoption pass, and **read `references/adopting-a-project.md` before starting one**. It is the full playbook — reconstructing each document honestly, absorbing an existing CLAUDE.md rather than replacing it, spec-history as an index rather than a fabrication. The two rules that govern it: documents only, never code; and done with Joey, not at him.
- **He just wants help with one thing** → help with that one thing. Not every session needs the apparatus, and insisting on it is how a system built to reduce friction becomes friction.

## What to know going in

- **The orientation is the product.** If the opening still requires going to check something to know where things are, it wasn't specific enough. Name the actual next step, not the phase.
- **A checked box with no code behind it means the previous session ended badly** — probably without `/vibe:wrap-session`. Fix the spec, and mention that wrapping is what prevents it; don't lecture.
- **`spec-history.md` grows forever and that's fine.** Append-only, newest at the top so the useful end is the reachable one.
