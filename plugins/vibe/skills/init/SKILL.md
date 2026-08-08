---
name: init
description: Initialise a project into the vibe system — scaffold or backfill the sister files (CLAUDE.md, DESIGN.md, ARCHITECTURE.md, SPEC.md, ENHANCEMENTS.md, SECURITY.md) from the living canon, set up git + .gitignore, and connect the GitHub remote. Use on a brand-new project or to graduate an existing folder. Trigger on /vibe:init, "vibe this project", "bring this project into the system", "scaffold the sister files".
---

# vibe:init — bring a project into the system

You are initialising the current project into Joey's vibe system. The canon is `DESIGN.md` at this plugin's root (`${CLAUDE_PLUGIN_ROOT}/DESIGN.md` — two directories up from this SKILL.md); read it first, every time. Sister-file skeletons are in `${CLAUDE_PLUGIN_ROOT}/templates/`.

## Order of work

**1. Establish the ground.**
- Confirm you're at the project root. If there's no git repo, `git init -b main`.
- Inventory what already exists: every markdown doc, any `.claude/` folder, any scripts/automation, rough shape of the content.

**2. Decide mode: fresh or backfill.**
- **Fresh** (empty or near-empty folder): brief interview — what is this project, what's its design intent, what's explicitly out of scope. Two or three questions, not a form.
- **Backfill** (existing work): map existing docs onto the sister set before creating anything. An existing `ARCHITECTURE.md` or spec-like doc is *kept and absorbed* — retitle, cross-link, and fill gaps; never overwrite content that exists. `project-instructions.md` from Cowork-era projects usually feeds CLAUDE.md's purpose and hard rules.

**3. Scaffold the sister files** from the templates, in this order: CLAUDE.md, SECURITY.md, then the rest *only where they earn their place* (per canon §2 — a docs-only project may skip ARCHITECTURE.md; never create a hollow file). Every generated file gets real content from the interview/inventory, not placeholder prose. CLAUDE.md records the canon version from the canon's header (`Canon: vibe X.Y.Z` in its header block).

**4. Secrets pass — before any commit.**
- Sweep the tree for credential material: `.env` files, `*key*`/`*secret*`/`*token*` filenames, `.pem`, and grep source files for obvious literals (long hex/base64 assignments, `api_key =`, `Bearer `).
- Anything found: move the value out to a gitignored env file, reference it by name in SECURITY.md, and confirm the pattern is in `.gitignore`. If a secret is already in *git history*, tell Joey it needs rotating — removal isn't enough.
- Write `.gitignore` before the first commit: env/secrets, caches, build output, logs, `.DS_Store`, large generated data (check for anything over ~5MB and ask whether it's source or artifact).

**5. Connect GitHub.**
- `gh repo create the-joey-ai/<folder-name> --private --source . --push` (private is the default, always — public only if Joey explicitly says so).
- If a repo/remote already exists, just ensure it pushes clean.

**6. Close.** Commit (`vibe: initialise project into canon X.Y.Z`), push, and report: files created vs absorbed, secrets findings, the repo URL, and what a first `/vibe:start-session` will see.

## Rules

- Never bulldoze. Existing content is truth; templates are scaffolding.
- Never commit a secret "temporarily".
- One question at a time if you must ask; prefer inferring from the folder over interviewing.
