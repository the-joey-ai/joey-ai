# Joey-ai
The public copy of taught skills and plugins; the publishing home for [joey.ai](https://joeyai.substack.com). Not the method, and not a workplace.

Project record: https://app.notion.com/p/3d256cb62e21813896ddc76217edb29b. State lives there: Brief, Current, and its Records. This repo holds cleaned copies of skills and plugins. Runtime is none. Repo `the-joey-ai/joey-ai` is **public**; push at wrap.

## Purpose
Ship cleaned artefacts so a post can point at something that works. A good session publishes a copy, or decides not to. It does not derive the practice; that work is `the-joey-ai/agents`.

## Documents
*What each holds, and when it changes.*

| Document | What it holds | It changes when |
|---|---|---|
| `README.md` | The public front door | What is shipped changes |
| `REQUIREMENTS.md` | What this publishing project is for | The goal shifts |
| `SECURITY.md` | What may be public, what must be stripped | A new kind of fact arrives |
| `skills/` | Taught skills plus packaged `.skill` | A skill is published or revised |
| `plugins/` | Marketplace plugins | A plugin is published or revised |

No ARCHITECTURE, DESIGN, SPEC, or ENHANCEMENTS. This is a showroom, not a build.

## Sessions
**Open.** Read the row's Current and Records, then `SECURITY.md`. If the session is about the method, stop and open `the-joey-ai/agents`.
**During.** Sweep for Joey-only facts before anything ships; record what was stripped.
**Close.** Rewrite Current, write Decisions rows and the Log row, set Next action. Commit. Push. Never force-push.

## House Rules
- **Open to publish, not to live.** The method lives in `the-joey-ai/agents`; this folder receives a cleaned copy, which is a new artefact, not a private folder with a different remote.
- **No bidirectional sync.** Taught plugins are updated only by a publishing decision; the copy here is behind the private method on purpose.
- **`marketplace.json` lists a public contact email.** That is deliberate.
