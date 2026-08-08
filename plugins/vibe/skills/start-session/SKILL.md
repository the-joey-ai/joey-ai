---
name: start-session
description: Open a working session in a vibe project — read CLAUDE.md, reconcile git state, check canon drift, and orient before acting. Trigger on /vibe:start-session, "start the session", "pick up where we left off" in any project carrying vibe sister files.
---

# vibe:start-session — orient before acting

The beginning-of-session ritual from the canon (`${CLAUDE_PLUGIN_ROOT}/DESIGN.md` §3). Run it completely before doing any project work.

## The ritual

**1. Read CLAUDE.md in full.** Land on Active State and the most recent Session Log entry — that's where the last session left the project. Follow its "where truth lives" order into any sister file the coming work touches.

**2. Reconcile git.**
- `git status` — a dirty tree means the last session never wrapped. Read the diff, work out what it was, and either finish its wrap (commit + push with an honest message) or surface it to Joey before starting anything new. Never start new work on top of an unexplained dirty tree.
- Pull. If this machine is behind (cloud sessions and other machines push too), sync before working.

**3. Check canon drift.** CLAUDE.md records the canon version this project last synced (`Canon: vibe X.Y.Z`). Compare against the current canon version in `${CLAUDE_PLUGIN_ROOT}/DESIGN.md`. If the canon is ahead: read its Amendment Log, tell Joey in one or two sentences what changed, apply what's mechanical (structure, new rules) to the project's derived files, and update the recorded version. The canon is living — projects catch up here, at session start, not by surprise mid-work.

**4. Orient, then work.** Open with a short orientation — where the project stands, what the last session left, what this session should do — and confirm direction if the next step is genuinely ambiguous. Then work normally, with one standing obligation carried from the canon: **docs live with the code**. When a fact settles or scope moves mid-session, touch the sister file then, not at wrap.

## Keep it light

This ritual is under a minute when the project is healthy. If step 2 keeps finding dirty trees, say so — it means wrap-session is being skipped, and the system is drifting.
