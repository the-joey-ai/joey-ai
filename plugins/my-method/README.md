# my-method
*A working method for building with an agent, through the lens of the project folder. Five skills, one document set, no service required.*

An agent gets you something working fast. What it doesn't get you is a project that still makes sense three sessions later, when the reason a decision was made has evaporated and the feature that got quietly cut is a surprise. That is a memory problem, and the fix is documents: a few of them, in the folder, written when they are needed. The skills make keeping them honest a habit.

The method is agent-agnostic. The instructions file is `AGENTS.md`, which Cursor and Codex read directly and Claude Code reaches through a one-line `CLAUDE.md`. Nothing here depends on a particular tool, a cloud service, or a particular person; "my" means yours.

## The five skills
| Skill | When | What it does |
|---|---|---|
| `establish` | A new idea, or an existing folder to bring in | The kickoff conversation: what and why, never how. Writes `REQUIREMENTS.md`, `ARCHITECTURE.md`, `SECURITY.md`, `AGENTS.md`, and the `CLAUDE.md` pointer. Adopt mode reconstructs them honestly for a folder that already exists, and never bulldozes an instructions file that works. |
| `start-session` | "Where were we?" | Orients in three sentences, checks the documents against the code, sets today's target. Writes a fresh `SPEC.md` when a phase begins and archives the old one. |
| `wrap-session` | "Done for today" | Trues up `SPEC.md`, banks every cut into `ENHANCEMENTS.md`, amends limitations and guardrails if reality bit, writes the session log, commits, pushes if there is a remote. |
| `worktree` | "Put this on a branch" | Start, status, land, prune. One script, worktrees under `.worktrees/`, never a silent conflict resolution. |
| `skill-helper` | "Make this a skill" | Build, extract from a chat, improve, or health-check a skill, judgment first. Carries the writing standard, the size ladder, and the test loop as references. |

## The documents
| Document | Born | Holds |
|---|---|---|
| `REQUIREMENTS.md` | establish | The north star, who it's for, what v1 must do, known limitations |
| `ARCHITECTURE.md` | establish | The pieces, how they connect, where it runs, decisions and why |
| `SECURITY.md` | establish | The absolutes, what data, where credentials live by name, what going public takes |
| `AGENTS.md` | establish | Character paragraph, document table, how sessions work, house rules, a three-entry session log |
| `CLAUDE.md` | establish | A pointer at `AGENTS.md` |
| `SPEC.md` | first start-session | The current phase only; archived to `docs/spec-history.md` |
| `ENHANCEMENTS.md` | first cut | Next up, the menu, known gaps, shipped |

## Install
```
/plugin marketplace add the-joey-ai/joey-ai
/plugin install my-method@joey-ai
```
Cursor and Codex add the same repo as a marketplace and install `my-method` from it.

## Where it came from
This is the folder-based method its author uses at work, extracted from the `vibe` plugin in this repo (the three session skills and the templates) and from a private pack (skill-helper and worktree). The `vibe` plugin stays for Claude Code builders who want the master-design loop; `my-method` drops design, drops the GitHub requirement, and names no one.
