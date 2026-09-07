<!-- guidance: instantiated by establish into a project folder. Fill every {{token}}.
     Strip every comment marked "guidance" like this one; keep plain comments — those are
     instructions future sessions need. Keep this file short: it loads on every session, so
     each line spends attention. -->

# {{project-name}}

{{one-line-plain-description}}

Why it exists and where it's going: `REQUIREMENTS.md`. {{repo-line}}

<!-- guidance: repo-line is "Repo: `owner/name` (private)." when the project is on GitHub, or
     "Lives in this folder only; no remote." when it is not. -->

## What this project is trying to be

{{character-paragraph}}

<!-- guidance: the highest-value block in this file. Draw it from REQUIREMENTS' north star,
     but write it as character rather than a feature list — what this thing is for, what it
     refuses to become, what "good" looks like here. A session that reads only this paragraph
     should make better decisions than one that read a list of features. Two or three
     sentences. -->

## The documents, and when they move

| Document | What it holds | It changes when |
|---|---|---|
| `REQUIREMENTS.md` | The north star — what this has to achieve | A limitation bites (amend Known limitations), or the goal genuinely shifts |
| `ARCHITECTURE.md` | The pieces, how they connect, and why each choice was made | The shape changes — and never silently |
| `SECURITY.md` | The guardrails: what data is allowed, where credentials live, what going public would take | New data, a new credential, or a new kind of access enters the project |
| `SPEC.md` | The working plan for the **current phase only** | Continuously while building; rewritten per phase by start-session |
| `ENHANCEMENTS.md` | Everything cut, deferred, or wanted-but-not-yet | The moment something is cut — not at the end of the session |
| Session log (bottom of this file) | What happened, session by session | Every wrap-session |

## How sessions work here

The rhythm is start-session to open and wrap-session to close. Both are worth running. Neither is a precondition for helping — if the owner just wants to get on with something, get on with it.

**If a session starts without the ritual,** do its job anyway before anything else: read `SPEC.md` and the newest session-log entry, then say plainly where the project stands.

**If the owner signals they're finishing** — "thanks, that's all", "I'll pick this up tomorrow" — offer wrap-session before letting go. Unbanked work is how a project loses its memory: the half-finished step, the thing that got cut, the decision made out loud and never written down.

**While building:** anything cut, deferred, or noticed-and-not-done goes into `ENHANCEMENTS.md` when it happens. If that file doesn't exist yet, create it right then rather than holding the note in your head: the title, then the line *"This is where the version you actually wanted lives while the agent builds the version that ships,"* then a `## The menu` heading with the entry under it. wrap-session will tidy it into its full shape.

**Before saying something is done:** run it.

## Git

Commit at natural seams. Wrap always commits, and pushes when a remote exists — work that isn't committed doesn't exist. Never force-push; never commit anything `SECURITY.md` forbids.

## Local-only ground

{{local-only}}

<!-- guidance: anything this project assumes that only exists on one machine — containers,
     scheduled jobs, mounted paths, services on the local network, another device. A cloud
     session cloning this repo reads this section to know what it can touch (code, docs) and
     what it cannot reach (the running thing). Delete this section if the project is fully
     self-contained. -->

## House rules

{{project-specific-gotchas}}

<!-- guidance: facts that would otherwise be rediscovered the hard way — a framework whose
     conventions differ from what a model was trained on (say so, and name where the real
     docs live), a command that only works run a particular way, a service that behaves
     oddly. Delete this heading if there are none yet, and add it back the first time
     something bites. This section is where a project gets genuinely easier to work in over
     time. -->

## Session log

<!-- Newest first, written by wrap-session. Format:

### YYYY-MM-DD — short title
**What happened:** what actually moved, in plain terms.
**Decisions:** what was decided, and why — especially anything a future session would otherwise relitigate.
**Open threads:** what's unresolved, and what the next session probably starts with.

Keep only the three most recent entries here. When a fourth is added, the oldest moves to
docs/session-history.md (newest first, created on first use). This file loads on every session,
so an uncapped log would quietly spend more of the budget than the instructions above it. The
archive keeps the full record; the same move as SPEC.md archiving to docs/spec-history.md.

Anything from an old entry that is still load-bearing does not belong in the archive — a decision
that still governs the project belongs in ARCHITECTURE.md's decisions table, and a trap worth
avoiding belongs in the house rules above. Move it up rather than trusting the archive to be
read. -->
