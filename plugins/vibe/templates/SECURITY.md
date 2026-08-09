<!-- guidance: instantiated by /vibe:new-project on day one, before there is code — the point
     is that nothing heads down a wrong path while the guardrails are still unwritten.
     "The absolutes" and "Before going public" ship verbatim; fill the middle three sections
     from the kickoff conversation. Strip guidance comments; keep plain ones. -->

# Security — {{project-name}}

The standing guardrails for this project. `/vibe:wrap-session` checks work against this file before anything is committed, and "Before going public" is the checklist if this repo's visibility ever changes.

## The absolutes

These hold across every project, they are not traded against convenience, and nothing in the rest of this file can weaken them:

- **No credentials in tracked files, ever.** API keys, tokens, passwords, private keys, connection strings, credentialled URLs. They live in a gitignored `secrets.env`, the keychain, or 1Password — referenced by name in this file, never by value anywhere. A credential that lands in git history gets **rotated**, not just removed; removal leaves it in every clone.
- **Private by default.** Every repo is private unless going public was a deliberate decision recorded in this file. Public is for things built to be published.
- **Family and personal data never reaches a public repo, and is minimised even in private ones.** Names, emails, household routines, health anything, location patterns. Private repos may carry what the project genuinely needs (a Kindle address the pipeline sends to); this file names each instance so it's a decision, not an accident.
- **Topology is sensitive.** Network layouts, tailnet inventories, machine maps, device lists, service ports reachable from anywhere. Fine in the private repo that owns them; never in a public one, and never more detailed than the project needs.

Being near one of these rarely kills a project. It usually means the data gets handled differently, or the repo stays private. Settle the handling before building, not after.

## What data this project handles

{{data-kinds}}

<!-- guidance: name every kind of information the project touches, and where each kind lives.
     Be specific — "channel names and EPG ids, in data/channels.json" beats "media data",
     because only the specific version can be checked later. If the honest answer includes
     something the absolutes name, stop and settle the handling before building. -->

## Where credentials actually live

{{credentials}}

<!-- guidance: each credential the project uses, BY NAME ONLY, and its real location —
     "READARR_API_KEY — secrets.env (gitignored), consumed by scripts/books/*". If the project
     has no credentials, say so in one line; that is a statement worth making explicitly.
     joey-plus-server's SECURITY.md is the reference example of this section done fully. -->

## Project-specific guardrails

{{project-guardrails}}

<!-- guidance: grows over the project's life. /vibe:wrap-session adds an entry whenever new
     data or a new kind of access enters the project. Each one is a rule this project holds
     itself to beyond the absolutes — what an integration is allowed to write, what gets
     logged and what never does, which fields may not travel. -->

## Before going public

Only relevant if this repo's visibility ever changes — and that change is a deliberate act, never a side effect:

1. **Sweep the tree** for anything the absolutes name: credential-shaped literals, personal data, topology. The tree being clean is necessary, not sufficient.
2. **Sweep the history.** Everything ever committed ships with a public repo. If history holds a secret, rotate it and either rewrite history or start the public repo from a fresh snapshot.
3. **Re-read this file's data section** as a stranger would. Provider hostnames, family names in docs, machine details — things acceptable in private become disclosures in public.
4. **Record the decision here**: what went public, when, and what was scrubbed or excluded to make that safe.
