# Joey-ai
The public home of taught skills and plugins from [joey.ai](https://joeyai.substack.com). Not a workplace: nothing here is a source of anything except what it ships.

This repo is **public** and standalone. Its project record lives in the owner's private notes, found by this repo's URL; nothing in this tree points back there. Runtime is none.

## Purpose
Ship cleaned artefacts so a post can point at something that works. A good session publishes a copy, or decides not to. It does not derive the practice; that happens elsewhere, in private.

## Documents
*What each holds, and when it changes.*

| Document | What it holds | It changes when |
|---|---|---|
| `README.md` | The public front door | What is shipped changes |
| `REQUIREMENTS.md` | What this publishing project is for | The goal shifts |
| `SECURITY.md` | What may be public, what must be stripped | A new kind of fact arrives |
| `plugins/` | Marketplace plugins: `constitutional-pattern` (Claude era; source of the taught skills), `vibe` (Claude Code), `my-method` (agent-agnostic) | A plugin is published or revised |
| `skills/` | Readable copy and packaged `.skill` of each taught skill, regenerated from the plugin by `scripts/package.sh` | The plugin's skill changed |

No ARCHITECTURE, DESIGN, SPEC, or ENHANCEMENTS. This is a showroom, not a build.

## Sessions
**Open.** Read `SECURITY.md`. If the session is about changing the method itself, stop; that work happens in private and arrives here as a cleaned copy.
**During.** Sweep for anything that names the owner's other work, machines, paths, or services before anything ships; record what was stripped in the commit message.
**Close.** Commit. Push. Never force-push.

## House Rules
- **Open to publish, not to live.** This folder receives a cleaned copy, which is a new artefact, not a private folder with a different remote.
- **No bidirectional sync.** Taught plugins are updated only by a publishing decision; the copy here is behind the private original on purpose.
- **Standalone.** A stranger reading any file here should never meet the owner's other projects, machines, or tools. If a fact is only needed for the owner's own work, it does not belong in this repo.
- **Two audiences.** `constitutional-pattern` and `vibe` are Claude-era and stay Claude-shaped. `my-method` is agent-agnostic and names nobody.
- **`marketplace.json` lists a public contact email.** That is deliberate.
