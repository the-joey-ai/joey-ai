# CLAUDE.md — {{PROJECT_NAME}}

<!-- One paragraph: what this project is, in plain words, for a session that knows nothing. End the header block with the canon line. -->

{{PURPOSE_PARAGRAPH}}

*Canon: vibe {{CANON_VERSION}}. Read this file first; it tells you where truth lives and how to work here. Sessions open with `/vibe:start-session` and close with `/vibe:wrap-session`.*

## Where truth lives (read in this order when context is missing)

<!-- Only list files that exist. Keep the one-line "what it holds + when to open it" per entry. -->

1. [SPEC.md](SPEC.md) — what this is and isn't. Ideas outside it go to ENHANCEMENTS.md, not into the work.
2. [ARCHITECTURE.md](ARCHITECTURE.md) — how it's actually built.
3. [DESIGN.md](DESIGN.md) — design intent and taste decisions.
4. [ENHANCEMENTS.md](ENHANCEMENTS.md) — ideas raised, not committed to.
5. [SECURITY.md](SECURITY.md) — the secrets contract. What may never be committed, and where credentials actually live.

## Hard rules

<!-- The 3-7 rules that bite during real work in THIS project. Settled decisions, phrased as constraints. Never silently contradict one. -->

- {{RULE}}

## Local-only ground

<!-- Anything that exists only on the Mac: local MCP servers, launchd jobs, mounted paths, other machines. A cloud session cloning this repo reads this section to know what NOT to chase. Delete if empty. -->

## File inventory

<!-- Every file/folder a session might touch, one line each: what it is, when to open it. -->

## Active State

<!-- Snapshot of NOW — always current, rewritten (not appended) at every wrap. What's live, what's mid-flight, what's next. -->

Snapshot as of {{DATE}}.

## Session Log

<!-- Newest first. One entry per session, appended at wrap: date — what happened, what it changed, what the next session starts with. -->

- **{{DATE}}** — Initialised into the vibe system (canon {{CANON_VERSION}}).
