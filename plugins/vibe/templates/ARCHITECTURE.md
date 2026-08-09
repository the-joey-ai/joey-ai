<!-- guidance: instantiated by /vibe:new-project. Plain language first, technical names in
     parentheses after — the document should read in one pass without translating anything.
     Strip guidance comments; keep plain ones. -->

# Architecture — {{project-name}}

{{one-line-shape}}

<!-- guidance: one sentence describing the shape of the whole thing — "a single web page that
     reads a spreadsheet and shows a filtered table", "a script on a launchd schedule that
     writes to a database and fires an ntfy digest". If this sentence is hard to write, the
     architecture is not settled yet, and building before it is settled is how projects get
     rebuilt. -->

## The pieces

{{pieces}}

<!-- guidance: one short paragraph per piece — what it is, what it does, what it talks to.
     Plain description first, technical name in parentheses: "the page people open (a Next.js
     app)", "where the information is kept (a Postgres database)". -->

## How they connect

{{flow}}

<!-- guidance: the flow in order, numbered. Start where a person starts, not where the code
     starts — "someone opens the page" before "the server queries the database". -->

## Where it runs

{{runs-where}}

<!-- guidance: the honest deployment picture, because it decides what a cloud session can and
     cannot do. Name the machine or service each piece runs on — the iMac (OrbStack, launchd),
     a hosted platform, a phone. Anything that only exists on one machine is local-only
     ground, and CLAUDE.md's local-only section should say so. -->

## Decisions, and why

| Decision | Why |
|---|---|
| {{decision}} | {{reason}} |

<!-- guidance: every significant choice with its reasoning in a sentence or two. This is the
     most valuable section six months out: it is what stops a later session quietly undoing a
     decision it does not understand, and what lets it extend one correctly. When a choice was
     close, record the option not taken and what would make it the better call — that is the
     difference between a decision a future session can reason about and one it can only
     obey. -->

## What this depends on outside itself

| What | What it's for | Where access lives | Status |
|---|---|---|---|
| {{dependency}} | {{purpose}} | {{access}} | {{status}} |

<!-- guidance: every service, account, key, or device the project needs and does not
     contain — and where the access actually lives (a key name in secrets.env, a 1Password
     entry, a subscription). These gate launching rather than building, which is why they are
     written down at kickoff: work continues against a placeholder while access is sorted. If
     a dependency turns out to be unobtainable, it becomes an entry in REQUIREMENTS' Known
     limitations and the target moves. -->
