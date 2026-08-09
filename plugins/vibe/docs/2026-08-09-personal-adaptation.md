# vibe v2 — personal adaptation of the work plugin

*2026-08-09 · Adapted from the work vibe plugin v0.5.1 (Babylist AI Enablement, Joey). The work plugin's design spec is the design of record for the shared principles; this file records only what changed crossing from team to personal, and why.*

## What carried unchanged

The whole spine: four taught moments (`my-design`, `new-project`, `start-session`, `wrap-session`); documents born at the moment of need, never as homework (SPEC at first session, ENHANCEMENTS at first cut); the north star that doesn't shrink; the master-design loop (interview → derive → harvest); phase-scoped SPEC with `docs/spec-history.md` archiving; CLAUDE.md choreography as the backstop for sessions that skip the ritual; the template instantiation contract and `verify-doc.sh`; the capped session log. Most template and skill prose is carried nearly verbatim — it was right.

## What changed, and why

| Work (v0.5.1) | Personal (v2) | Why |
|---|---|---|
| `internal-hosting-checker` skill | **Dropped** | Joey's call — it exists for the Vercel internal-hosting rollout. Its useful residue became SECURITY.md's "Before going public" checklist. |
| Master at `people/<name>/DESIGN.md` in the team repo | Master at `~/Claude/my-design/DESIGN.md`, its own private repo | One builder, no shared repo. Its own repo so cloud sessions and other machines reach it. `people-README.md` template dropped with the folder concept. |
| Team monorepo: kind-folders, index rows, `CLAUDE-repo.md` | One project = one folder = one private repo on `the-joey-ai`; repo-shaped rules live inline in `CLAUDE-project.md` | The Aug 2026 graduation settled this: cloud sessions clone one repo, so the repo is the project. No index to maintain; the GitHub account is the index. |
| Babylist AI-governance absolutes in SECURITY.md | Personal absolutes: no credentials in tracked files (rotate on leak); private by default; family/personal data never public; topology is sensitive | Rewritten from what the graduation actually found: 21 hardcoded credentials in joey-plus-server, a tailnet inventory, family data in the Books pipeline. |
| Wrap proposes the commit; builder pushes (shared repos) | **Wrap commits and pushes**, verifies it landed; never force-push | They're Joey's own repos, and the standing rule is "work that isn't on GitHub doesn't exist" — 117 local-only commits of iptv history nearly proved why. |
| Vercel gotchas (deployment protection, read-only fs, `apps/` path permanence) | "Where it runs" section in ARCHITECTURE + "Local-only ground" in CLAUDE.md | The personal failure mode isn't an unprotected URL — it's a cloud session chasing OrbStack containers that only exist on the iMac. |
| Stage 2's "reachable outside Babylist?" | "Reachable by anyone but you?" (household / tailnet / public) | Same structural question, personal boundary. |
| Adoption reference written from the showroom-qr retrofit | Rewritten around **absorb, never bulldoze** for Cowork-era CLAUDE.mds | Joey's existing projects have rich, converged CLAUDE.md files; adoption reshapes them rather than replacing them with templates. The 365 KB joey-plus-server log is the cautionary tale the capped-log rule cites. |
| Start-session verify: spec vs code, uncommitted work, index row | Spec vs code, uncommitted work **+ pull**, automation commits | No index; but scheduled tasks (iptv reconcile) commit daily, and cloud/phone sessions mean the remote can be ahead. |

## Superseded

vibe v1.0.0 (2026-08-08) — built before the work plugin was available to read; it baked a versioned "canon" into the plugin and scaffolded six static sister files at init. Replaced wholesale by this adaptation. The `Canon: vibe 1.0.0` lines it stamped into joey-plus-server and joey-plus-iptv CLAUDE.mds were updated when v2 shipped.
