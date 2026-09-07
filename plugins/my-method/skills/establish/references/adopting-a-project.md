# Adopting an existing project

The playbook for bringing a project that predates this method — or was built without it — into the document system. Most working folders are like this: a rich, converged `CLAUDE.md` or `AGENTS.md` of their own, a `docs/` folder under different names, plans and handoffs scattered where they were last useful.

The one rule over everything: **documents only, never code.** Adoption records what exists; the moment you want to change what exists, that's a phase, and it goes through a `SPEC.md` like any other work.

## Do it with the owner, not at them

Reconstructing requirements from code alone produces a description of what exists rather than what was wanted — and the gap between those two is precisely the most valuable thing to capture. Read everything first (README, the instructions file, old specs and plans, the code's actual shape) so your questions are sharp, then ask rather than infer wherever intent matters.

## Absorb, never bulldoze

This is the method's hardest rule, because the existing documents are good. An instructions file with a file inventory, an active-state section, and a session log is already doing most of the `AGENTS.md` template's job — adoption **reshapes and fills gaps**, it does not replace a working document with a fresh template. Concretely:

- An existing `CLAUDE.md` or `AGENTS.md` keeps its voice and its earned content (key-context sections were paid for in real failures). Add what's missing — the document table, the session bookend choreography, a local-only ground section, the capped-log rule — inside the existing file's structure. If the content lives in `CLAUDE.md`, it moves to `AGENTS.md` and `CLAUDE.md` becomes the pointer; the words themselves survive.
- Existing docs map to the method's set rather than duplicating it: an operational spec under another name is reference and stays; an existing `ARCHITECTURE.md` stays; `ENHANCEMENTS.md` restructures to the four sections only if the existing shape isn't working.
- An unbounded session log gets the rolling-window treatment: three entries in the instructions file, the rest to `docs/session-history.md`. An instructions file that has grown to hundreds of kilobytes is the cautionary tale, and it is fixed exactly this way.

## Mark the retroactivity, once per document

Each *newly reconstructed* document opens with one italic line: *written retroactively on \<date\>, from \<sources\> — it records what the project has been for all along rather than a new plan.* Honesty, not apology. Don't repeat the disclaimer past the opening line.

## The documents, in the order that works

**`REQUIREMENTS.md`.** The north star comes from the owner's mouth, not the feature list — ask what the project is *for* and write that. The v1 list is whatever shipped, checked off (`- [x]`), which reads as history rather than plan and is correct. Constraints the project has always lived with go in Known limitations even though they were never "hit" during a session.

**`ARCHITECTURE.md`.** The decisions table is the reason to write this document at all, and for a live project the *why* is recoverable: ask "why is this two containers?", "why does this go through a gateway?", and record the answers. A decision whose reason nobody remembers gets recorded as that — "reason not recovered; revisit before changing" — which is still better than silence. Include "Where it runs" honestly; for anything on a home server that section *is* the local-only ground.

**`SECURITY.md`.** Often the most valuable document of the pass, because a running project has usually *made* its security decisions without writing them down. Write what data it actually holds (read the tree, not the README's claims), where every credential lives by name, and — for anything that might ever go public — what the history contains. Finding credentials hardcoded is common; moving them to `secrets.env` and listing what to rotate is the pass done fully.

**`ENHANCEMENTS.md`**, restructured to the four sections if a deferred-work file already exists. Two rules:

- **Nothing gets dropped.** After restructuring, verify against the original — pick a dozen distinctive phrases from the old file and confirm each survives somewhere. Anything genuinely gone must be a decision you can name, not an accident.
- **Relocate operational knowledge out.** Old wish-list files accumulate ops notes because there was nowhere else to put them. They go to `ARCHITECTURE.md`'s decisions or `AGENTS.md`'s house rules — a wish list is not where anyone looks before running a migration. Note the move so it's findable.

**`docs/spec-history.md`** as an *index*, not a fabrication. Old plans and handoffs stay where they are; spec-history gets one dated entry per shipped phase pointing at them, newest first, with a line saying entries before the adoption are index entries rather than archived specs. **Never backdate a `SPEC.md`** — a spec is born when work starts. If the project is between phases at adoption, having no `SPEC.md` is the correct state.

## Close the adoption

Write a session-log entry describing the adoption itself: what was created, what moved where, what was corrected, and what's genuinely open. Commit, and push if there is a remote. Then the project is just a project in this method — the next session starts normally.

## Sibling projects

If one product spans two repos or deployments, keep the full document set **once**, in the primary, and give the sibling a short `AGENTS.md` of its own: what it is, the rules that are genuinely its own, and a table pointing at the primary's documents. Two full document sets for one product drift apart; a pointer can't.
