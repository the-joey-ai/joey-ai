# constitutional-pattern
*The Constitutional Pattern, for Claude. Three skills, one per layer of instruction Claude reads.*

Anthropic's constitution established a way of instructing a model: explain the why, trust judgment over rigid rules, define character rather than conduct. These skills apply that pattern to the documents a person owns in Claude, from the widest scope to the narrowest.

| Skill | Writes | Scope |
|---|---|---|
| `profile-builder` | The profile in Claude Settings | Every chat and project |
| `coworker` | Cowork Global Instructions | Every Cowork session |
| `project-instructions` | A project's instructions, and its folder `CLAUDE.md` | One project |

Each is a conversation, not a form. Run them in that order the first time; re-run any one when life or the work changes.

## Install
```
/plugin marketplace add the-joey-ai/joey-ai
/plugin install constitutional-pattern@joey-ai
```
Each skill is also packaged on its own as a `.skill` download in [`skills/`](../../skills/) for Claude.ai and Cowork. The plugin is the source; the downloads are regenerated from it by `scripts/package.sh`.

## Posts
- profile-builder: [Start with your profile](https://joeyai.substack.com/p/the-profile)
- coworker: [Stop starting every session cold](https://joeyai.substack.com/p/the-coworker-layer)
- project-instructions: post to come.

## Changes
- 1.0.1 (2026-09-06). Skill descriptions quoted so every marketplace indexer accepts them; text unchanged.
- 1.0.0 (2026-09-06). First release of the three together. `project-instructions` gains a fallback when the question picker or a present tool is missing, a Claude Code line for the folder file, and a Gotchas section; nothing else changed from the taught version.
