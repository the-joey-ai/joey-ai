# joey.ai
The publishing home for [joey.ai on Substack](https://joeyai.substack.com): skills and plugins from the Constitutional Pattern series, shipped as working artefacts rather than just words.

Two audiences, two packs.

| Pack | For | What it is |
|---|---|---|
| [constitutional-pattern](plugins/constitutional-pattern/) | Claude users | `profile-builder`, `coworker`, `project-instructions`: the three skills that write the profile, the Cowork Global Instructions, and a project's instructions the constitutional way |
| [vibe](plugins/vibe/) | Claude Code builders | The document discipline that keeps a project coherent session after session: four moments (`my-design`, `new-project`, `start-session`, `wrap-session`), documents born when needed, a master design every project derives from |
| [my-method](plugins/my-method/) | Anyone building with an agent, in Claude Code, Cursor, or Codex | The same discipline through the lens of the project folder, with no tool or service required: `establish`, `start-session`, `wrap-session`, `worktree`, `skill-helper`. Names nobody; "my" means yours |

## Install
This repo is a plugin marketplace for Claude Code, Cursor, and Codex. In Claude Code:
```
/plugin marketplace add the-joey-ai/joey-ai
/plugin install constitutional-pattern@joey-ai
/plugin install vibe@joey-ai
/plugin install my-method@joey-ai
```
In Cursor: Dashboard → Plugins → Add Marketplace → `the-joey-ai/joey-ai`. In Codex: `codex plugin marketplace add the-joey-ai/joey-ai`.

## Skills on their own
Each folder under [`skills/`](skills/) holds a skill's readable `SKILL.md` and its packaged `.skill` for Claude.ai and Cowork. The canonical download is the **GitHub Release asset** linked from the post it ships with.

| Skill | Post |
|---|---|
| [profile-builder](skills/profile-builder/) | [Start with your profile](https://joeyai.substack.com/p/the-profile) |
| [coworker](skills/coworker/) | [Stop starting every session cold](https://joeyai.substack.com/p/the-coworker-layer) |
| [project-instructions](skills/project-instructions/) | Post to come |

---

*This repo was previously `claude-skills`; old links redirect. The marketplace was previously named `method`; `vibe@method` is now `vibe@joey-ai`.*
