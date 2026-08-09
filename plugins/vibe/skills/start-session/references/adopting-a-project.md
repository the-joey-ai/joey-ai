# Adopting an existing project into the vibe structure

The playbook for bringing a project that predates vibe — or was built without it — into the document system. Joey's ecosystem is full of these: Cowork-era projects with rich, converged CLAUDE.md files of their own (joey-plus-server, joey-plus-iptv, my-substack), and code projects with doc sets under different names (the Joey browser's `docs/`, Stork's `Context/`).

The one rule over everything: **documents only, never code.** Adoption records what exists; the moment you want to change what exists, that's a phase, and it goes through a `SPEC.md` like any other work.

## Do it with Joey, not at him

Reconstructing requirements from code alone produces a description of what exists rather than what was wanted — and the gap between those two is precisely the most valuable thing to capture. Read everything first (README, CLAUDE.md, old specs and plans, the code's actual shape) so your questions are sharp, then ask rather than infer wherever intent matters.

## Absorb, never bulldoze

This is the personal system's hardest rule, because the existing documents are good. A Cowork-era CLAUDE.md with a File Inventory, Active State, and Session Log is already doing most of CLAUDE-project.md's job — adoption **reshapes and fills gaps**, it does not replace a working document with a fresh template. Concretely:

- An existing CLAUDE.md keeps its voice and its earned content (Key Context sections were paid for in real failures). Add what's missing — the document table, the session bookend choreography, a local-only ground section, the capped-log rule — inside the existing file's structure.
- Existing docs map to the vibe set rather than duplicating it: a `STREAMING-SPEC.md` is operational reference and stays; an existing `ARCHITECTURE.md` stays; `ENHANCEMENTS.md` restructures to the four sections only if the existing shape isn't working.
- An unbounded session log gets the rolling-window treatment (three entries here, the rest to `docs/session-history.md`) — joey-plus-server's 365 KB CLAUDE.md is the cautionary tale, and it was fixed exactly this way.

## Mark the retroactivity, once per document

Each *newly reconstructed* document opens with one italic line: *written retroactively on \<date\>, from \<sources\> — it records what the project has been for all along rather than a new plan.* Honesty, not apology. Don't repeat the disclaimer past the opening line.

## The documents, in the order that works

**`REQUIREMENTS.md`.** The north star comes from Joey's mouth, not the feature list — ask what the project is *for* and write that. The v1 list is whatever shipped, checked off (`- [x]`), which reads as history rather than plan and is correct. Constraints the project has always lived with go in Known limitations even though they were never "hit" during a session.

**`ARCHITECTURE.md`.** The decisions table is the reason to write this document at all, and for a live project the *why* is recoverable: ask "why is this two containers?", "why does this go through a gateway?", and record the answers. A decision whose reason nobody remembers gets recorded as that — "reason not recovered; revisit before changing" — which is still better than silence. Include "Where it runs" honestly; for iMac-stack projects that section *is* the local-only ground.

**`SECURITY.md`.** Often the most valuable document of the pass, because a running project has usually *made* its security decisions without writing them down. Write what data it actually holds (read the tree, not the README's claims), where every credential lives by name, and — for anything that might ever go public — what the history contains. The joey-plus-server SECURITY.md (21 credentials found hardcoded, moved to `secrets.env`, rotation list) is the reference for what this looks like done fully.

**`ENHANCEMENTS.md`**, restructured to the four sections if a deferred-work file already exists. Two rules:

- **Nothing gets dropped.** After restructuring, verify against the original — pick a dozen distinctive phrases from the old file and confirm each survives somewhere. Anything genuinely gone must be a decision you can name, not an accident.
- **Relocate operational knowledge out.** Old wish-list files accumulate ops notes because there was nowhere else to put them. They go to ARCHITECTURE.md's decisions or CLAUDE.md's house rules — a wish list is not where anyone looks before running a migration. Note the move so it's findable.

**`docs/spec-history.md`** as an *index*, not a fabrication. Old plans and handoffs stay where they are; spec-history gets one dated entry per shipped phase pointing at them, newest first, with a line saying entries before the adoption are index entries rather than archived specs. **Never backdate a `SPEC.md`** — a spec is born when work starts. If the project is between phases at adoption, having no SPEC.md is the correct state.

**`DESIGN.md`**: if one exists, don't rewrite it — add the "Derived from" record at the top: where the taste came from, what translated, and which decisions are harvest candidates for the master. If no master exists yet, say this project is a source for extracting one, and point at `/vibe:my-design`.

## Close the adoption

Write a session-log entry describing the adoption itself: what was created, what moved where, what was corrected, and what's genuinely open. Commit and push. Then the project is just a vibe project — the next session starts normally.

## Sibling projects

If one product spans two repos or deployments, keep the full document set **once**, in the primary, and give the sibling a short `CLAUDE.md` of its own: what it is, the rules that are genuinely its own, and a table pointing at the primary's documents. Two full document sets for one product drift apart; a pointer can't. (joey-plus-server and joey-plus-iptv are *not* siblings — separate products, separate sets; the boundary line in each one's CLAUDE.md is the model.)
