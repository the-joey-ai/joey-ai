---
name: wrap-session
description: "Close a working session on a vibe project by banking everything before it evaporates — update SPEC.md to the honest state including half-done steps, move anything cut or deferred into ENHANCEMENTS.md, amend REQUIREMENTS known limitations if reality bit, offer design learnings to the master DESIGN.md, write the session log entry in CLAUDE.md, then commit and push. Use when a session on a vibe project is ending — “let's wrap”, “done for today”, “that's all for now”, “I'm heading out” — or when the command is invoked, and offer it proactively the moment Joey signals he's finishing."
---

# Wrap Session

Everything learned this session that isn't written down is gone. Not degraded — gone. The half-finished step, the thing that got cut, the decision made out loud, the reason something was done a strange way. This skill is the five minutes that turns a session into something the next one can build on.

**Do the work rather than interviewing about it.** Most of what follows you can determine yourself from the session, the diff, and the documents. Only one thing genuinely needs Joey: whether a design learning should travel up to the master. Everything else: write it, then report what you wrote in a few lines. Someone who says "let's wrap" is telling you they're finished talking.

## 1. `SPEC.md` to the honest state

Check off what genuinely landed — verified by the code existing and working, not by intention. Then write the truth into progress notes, especially the half-done parts:

> Search box filters correctly. Sorting renders but is still fake data — the API returns a hardcoded array.

That sentence is worth more than every checked box in the file, because it's what stops the next session either redoing finished work or trusting something that doesn't work. The test: could `/vibe:start-session` orient a stranger from this file alone?

Never check a box you didn't verify. An optimistic checkmark is worse than an unchecked one — it converts a known gap into a hidden one.

## 2. Bank the cuts

Sweep the session for everything that was trimmed, deferred, worked around, or noticed-and-not-done. Include the things mentioned in passing and the things you decided silently to skip — those are the ones that vanish.

Each entry: what it is, why it matters, rough size (S/M/L), and the date when it matters.

`ENHANCEMENTS.md` has four sections that mean different things, and putting an entry in the wrong one is how the file stops being usable. Route deliberately:

- **Next up** — the two or three things that genuinely come next. `/vibe:start-session` reads this first when a phase finishes, so it is the one section that must stay current and short.
- **The menu** — everything else banked, grouped by theme. Most entries land here.
- **Known gaps** — things that are *missing* rather than wanted: a rough edge shipped knowingly, a case not handled, a manual step nobody automated. Mark one ✅ when it closes rather than deleting it.
- **Shipped** — move entries here when a phase delivers them, with the date. Moved, not deleted.

Every wrap should leave **Next up** reflecting what you would actually do next, because that is what the next session gets offered.

**If `ENHANCEMENTS.md` doesn't exist yet, this is where it's born** — create it from `../../templates/ENHANCEMENTS.md`, per `../../templates/README.md`, and say in one sentence why it now exists. The line under its title is the script:

> This is where the version you actually wanted lives while Claude builds the version that ships.

Say it once, plainly, and move on. Don't explain the whole system.

## 3. Reconcile the documents with reality

Documents that describe the world rather than the plan go stale silently.

**`REQUIREMENTS.md`, if something genuinely blocked the work** — an API with no way in, a platform restriction, a dead service. Amend known limitations: what was hit, what the target became instead, and what would unblock the original ambition. Then say explicitly that the north star hasn't changed — the gap between the north star and the current target is information, not failure.

**`SECURITY.md`, if the project grew a new kind of data, a new credential, or a new way in.** A new key goes in `secrets.env` and gets its name-only row; a new integration gets a guardrail line. This is also the secrets backstop: scan the diff and untracked files for anything credential-shaped before staging — a literal that should be in `secrets.env`, personal data in a repo that shouldn't carry it. Anything found gets pulled out *before* the commit, and SECURITY.md records the pattern so it can't recur. A finding here also means checking whether it ever reached history — if it did, it gets rotated, not just removed.

## 4. Harvest the design

One question, not an interview:

> Did anything this session teach you something about how you want your things to look or behave — something worth keeping for everything you build, not just this project?

If yes, append it to the **harvest inbox** at the top of the master at `~/Claude/my-design/DESIGN.md`.

**Append only.** Never edit the Signature or Execution notes directly — `/vibe:my-design` processes the inbox properly, weighing whether a learning is taste that travels or a recipe for one platform. Reaching into the master mid-wrap is how that distinction gets quietly lost.

**If there is no master yet**, don't create it here. Say the learning is worth keeping and that `/vibe:my-design` is where it lands, and record it in the project's `DESIGN.md` under project-specific decisions so it survives until then.

If the project's `DESIGN.md` gained a project-specific decision this session, that's the obvious candidate — read it out and ask.

## 5. Log the session

Prepend to the session log at the bottom of the project's `CLAUDE.md`, newest first:

```markdown
### 2026-08-09 — vendor list page, half built
**What happened:** Search and filtering work end to end. Sorting is stubbed.
**Decisions:** Filtering happens in the browser rather than the database — the list is small and it keeps the page instant. Revisit past a few hundred rows.
**Open threads:** Sorting needs the real API. Whether archived vendors should show.
```

Decisions are the highest-value line. Write the ones a future session would otherwise relitigate — and include the reasoning, because a decision without its why gets overturned by the next session that finds it inconvenient.

**Keep the log capped at three entries** — when a fourth arrives, the oldest moves to `docs/session-history.md`, newest first (create on first use). Anything still load-bearing in an aged-out entry moves *up* — a governing decision to ARCHITECTURE.md's table, a trap to house rules — never just into the archive.

If you genuinely don't know what happened earlier in the session — a long session, a compacted context — say so in the entry and write what you can verify from the diff. An honest partial log is useful; an invented one is worse than none.

## 6. Commit and push

One commit unless the session had genuinely separable pieces. Message says what the session did in plain words. Then **push, and verify it landed** (`git status` clean and up to date with origin). These are Joey's own repos: the push is part of the wrap, not a proposal — work that isn't on GitHub doesn't exist. Never force-push; if the push fails (auth, network, diverged), fixing that *is* the remaining work of the session.

## Close out

One or two sentences: where the project stands now, and what the next session probably starts with. That's the handoff — to future Joey, most likely on a different device.

## Boundaries

- **Don't reopen the work.** If you notice something that should be different, it goes in `ENHANCEMENTS.md`. Starting a fix during wrap is how a five-minute close becomes another hour, and how the wrap ends up not happening.
- **Never commit around a secrets finding.**

## What to know going in

- **Offer this before it's asked for.** The moment Joey says "thanks, that's great" or "I'll pick this up tomorrow", offer to wrap. Left to habit, wrapping is the first thing to go, and its absence is invisible until the next session opens confused.
- **A wrap that finds nothing to bank is suspicious.** Real sessions cut things. If the sweep comes up empty, look again at what was decided rather than what was built.
- **Half-done is the normal state to record.** The spec is a working document, not a report — messy and true beats clean and wrong.
