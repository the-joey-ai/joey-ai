# Joey-ai
*written retroactively on 2026-08-16, from README.md, marketplace.json, and the tree.*

The public copy of taught skills and plugins. Publishing home for [joey.ai](https://joeyai.substack.com). Not the method, and not a workplace.

Repo: `the-joey-ai/joey-ai` (public). Why it exists: `REQUIREMENTS.md`.

## Purpose
Ship cleaned artefacts — skills and plugins — so a post can point at something that works. A good session here publishes a copy, or decides not to. It does not derive the practice. That work is `~/agents/projects/lab` and `~/agents/method`.

## Documents
*What each holds, and when it changes.*

<!-- A cloud session never sees lab or WRITING.md. Write from this: sisters
     are CAPS, simply named, at the root; a nested container may earn its own;
     everything else is kebab in a folder named for what it holds. Date a
     filename only when the date is the point. Headings Title Case and short;
     extra clause in italics underneath, no blank line. Callouts are GitHub
     alerts. -->

| Document | What it holds | It changes when |
|---|---|---|
| `REQUIREMENTS.md` | What this publishing project is for | The goal shifts |
| `SECURITY.md` | What may be public, what must be stripped | A new kind of fact arrives |
| `STATUS.md` | One screen: where publishing stands | Every close |
| `history/sessions.md` | The journal, newest first | Every close |
| `skills/` | Taught skills + packaged `.skill` | A skill is published or revised |
| `plugins/` | Marketplace plugins | A plugin is published or revised |

No ARCHITECTURE, DESIGN, SPEC, or ENHANCEMENTS. This is a showroom, not a build. Published artefacts keep their own names.

## Sessions
This file is the system. Local skills help if they are installed. A session that never invokes them still does these jobs.

**Open.** Read `STATUS.md` and `SECURITY.md`. If the session is about the method, stop and open lab.

**During.** Sweep for Joey-only facts before anything ships. Record what was stripped.

**Close.** Rewrite `STATUS.md`. Prepend `history/sessions.md`. Commit. Push.

## Git
This repo is public. Commit at natural seams. Close always pushes. Never force-push. Never commit anything `SECURITY.md` forbids. No bidirectional sync with lab.

## House Rules
- **Open to publish, not to live.** Lab is `~/agents/projects/lab`. This folder receives a cleaned copy.
- **The public copy is a new artefact**, not a private folder with a different remote.
- **Do not update taught plugins to match lab in this invert.** A later publishing session decides what the next shipped vibe looks like. The copy here is behind the destination method on purpose until that session.
- **marketplace.json** lists a public contact email. That is deliberate.
