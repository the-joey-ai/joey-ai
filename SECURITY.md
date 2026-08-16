# Security
*written retroactively on 2026-08-16, from README.md, marketplace.json, and lab's Before Teaching rule.*

The standing guardrails for this project. Close checks work against this file before anything is committed.

## Absolutes
- **No credentials in tracked files, ever.**
- **This repo is public.** That is a recorded decision: it is the publishing home for joey.ai. It is not a working repo that was opened by accident.
- **Family and personal data never reaches this repo.** Names of routines, health, location, household detail. A pack may know a person has a household. It may not describe Joey's.
- **Employer and job-search context never lives here.**
- **Topology is sensitive.** Machine maps and tailnet inventories stay in the private projects that own them.

## Data
Taught skills and plugins. Marketplace metadata. A public contact email in `marketplace.json` (`joeyali@duck.com`) — deliberate. No runtime secrets. No résumés. No channel databases.

## Credentials
None. This repo has no credentials.

## Guardrails
- Sweep every artefact before it ships. Joey-only paths (`~/Claude/Cowork`, `~/code`, machine names) do not belong in a taught file.
- The public copy is a new artefact. Promotion copies a cleaned version in; it does not retarget a private remote.
- History ships with the repo. If a forbidden fact lands, rotate what can be rotated and treat the commit as public forever.

## Before Teaching
1. Sweep the pack for Joey-only facts, paths, and names a stranger should not need.
2. Record in that session what was stripped.
3. Do not open lab, career-search, or any private project to "just copy the folder."
