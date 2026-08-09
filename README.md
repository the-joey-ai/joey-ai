# joey.ai

The publishing home for [joey.ai on Substack](https://joeyai.substack.com) — skills and plugins from the Constitutional Pattern series, shipped as working artefacts rather than just words.

## Skills — `skills/`

Each folder holds a skill's readable `SKILL.md` alongside its packaged `.skill`. The canonical download for every skill is its **GitHub Release asset**, linked from the post it ships with.

| Skill | Post |
|---|---|
| [profile-builder](skills/profile-builder/) | [Start with your profile](https://joeyai.substack.com/p/the-profile) |
| [coworker](skills/coworker/) | [Stop starting every session cold](https://joeyai.substack.com/p/the-coworker-layer) |

## Plugins — `plugins/`

This repo is also a Claude Code plugin marketplace:

```
/plugin marketplace add the-joey-ai/joey-ai
```

| Plugin | What it is |
|---|---|
| [vibe](plugins/vibe/) | The document discipline that keeps a project coherent session after session — four moments (`my-design`, `new-project`, `start-session`, `wrap-session`), documents born when needed, a master design every project derives from. Install: `/plugin install vibe@joey-ai` |

---

*This repo was previously `claude-skills`; old links redirect.*
