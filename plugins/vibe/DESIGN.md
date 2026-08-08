# The Vibe Canon

**Canon version: 1.0.0** — last amended 2026-08-08.

This is the living design for how every project is worked. It is the one document all projects derive from: when a project is initialised with `/vibe:init`, its sister files are cut from this canon; when the canon moves, projects catch up at their next `/vibe:start-session`. The canon lives here, in the plugin, and nowhere else — projects hold a *derived version*, never a fork.

Amend this file whenever the way of working genuinely changes, bump the version (semver: patch for wording, minor for a new rule, major for a structural change), and note the change in the Amendment Log at the bottom.

---

## 1. The shape of a project

One project = one folder = one repo. The folder is the repo clone; the repo is the project's identity in every surface — local Claude Code sessions, cloud sessions from the phone, GitHub itself. There is no project that matters that is not a repo, and no repo that is not pushable right now.

Repos are **private by default**. A repo goes public only by deliberate decision, only when it exists to be published.

## 2. The sister files

Every project carries the same small set of documents, created at initialisation and kept alive for the project's whole life. **CLAUDE.md is the centre point** — the first thing read in every session, the file that says where truth lives. The others each hold one kind of truth:

| File | Holds | Test for where something goes |
|---|---|---|
| `CLAUDE.md` | Orientation: purpose, where truth lives, hard rules, file inventory, Active State, Session Log | "What must a fresh session know first?" |
| `DESIGN.md` | The project's design intent — how it should look, feel, and behave; taste decisions; the personality contract if it has one | "Is this about what we're making?" |
| `ARCHITECTURE.md` | How the system is actually built: stack, boundaries, subsystem designs, findings from real work | "Is this about how it's built?" |
| `SPEC.md` | What it does and doesn't do — scope, behaviour, the line between v-now and not-now | "Is this about what's in and out?" |
| `ENHANCEMENTS.md` | Ideas raised but not committed to. The pressure valve that keeps SPEC honest and sessions focused | "Good idea, not now?" |
| `SECURITY.md` | The secrets policy: what may never be committed, where credentials actually live, the .gitignore contract, privacy posture | "Could this hurt if the repo leaked?" |

Rules that keep the set honest:

- **Files earn their place.** A docs-only knowledge hub may genuinely have no ARCHITECTURE.md; don't create hollow files to complete the set. But CLAUDE.md and SECURITY.md exist in every project, always — orientation and the secrets contract are never optional.
- **Docs live with the code.** When work in a session changes an architectural fact, settles a scope question, or raises an idea, the sister file is updated *in that same session* — that's what wrap-session enforces. Docs that lag the code are worse than no docs.
- **Decisions don't get re-litigated.** Once something is settled and written down, it stays settled unless new facts arrive. Larger projects may add a DECISIONS.md with numbered entries; smaller ones settle things in the relevant sister file. Either way: never silently contradict a written decision.
- **Existing docs are absorbed, not replaced.** When vibe arrives in a project that already has documents, they are mapped into the sister set and kept — initialisation reorganises, it never bulldozes.

## 3. The session rituals

A session has a beginning and an end, and both are ceremonies with jobs to do.

**`/vibe:start-session`** — orient before acting:
1. Read CLAUDE.md in full; land on Active State and the last Session Log entry.
2. `git status` and pull. A dirty tree means the last session didn't wrap — reconcile it before new work.
3. Check the project's recorded canon version against the plugin's. If the canon has moved, say what changed and sync the project's derived files.
4. Open with a short orientation: where things stand, what the last session left, what this session should do. Then work.

**`/vibe:wrap-session`** — nothing is left behind:
1. Sweep the session's work against the sister files and update every one the work actually touched.
2. Refresh Active State in CLAUDE.md; append a dated Session Log entry — what happened, what it changed, what's next.
3. Run the secrets check against everything about to be committed.
4. Commit with a message that says what the session did, and **push**. Work that isn't on GitHub doesn't exist.
5. Close with a plain report: what shipped, what docs moved, what the next session starts with.

The rituals are cheap on purpose. If wrap-session feels heavy, the session ran too long without touching its docs.

## 4. Git and GitHub discipline

- **Everything pushes.** The remote is the project. Local-only history is a liability (it was nearly the fate of 117 commits of joey-plus-iptv history).
- **Secrets never enter history.** Credentials live in gitignored env files or the keychain, referenced by name in SECURITY.md. The wrap-session secrets check is a backstop, not the policy — the policy is that a key never appears in a tracked file in the first place. If one ever lands in history, it gets rotated, not just removed.
- **.gitignore exists before the first commit**, covering: env/secrets files, caches and build output, logs, `.DS_Store`, and any large generated data.
- **Cloud-ready by default.** CLAUDE.md at the repo root; `.claude/settings.json` committed when the project needs settings; nothing in the repo assumes files outside the repo exist. A cloud session cloning this repo cold should be able to orient and work. Anything that only works on the Mac (local MCP servers, launchd, local paths) is named in CLAUDE.md as local-only so a cloud session doesn't chase it.

## 5. Amendment Log

- **1.0.0 — 2026-08-08** — First personal canon, adapted from the work vibe plugin. Sister set fixed at six (CLAUDE, DESIGN, ARCHITECTURE, SPEC, ENHANCEMENTS, SECURITY) with earn-their-place flexibility; session rituals defined; GitHub discipline written down after the repo survey found four projects with credentials in tracked files and a 117-commit repo with no remote.
