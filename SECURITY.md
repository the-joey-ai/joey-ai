# Security
*The standing guardrails for this project. Close checks work against this file before anything is committed.*

## Absolutes
- **No credentials in tracked files, ever.**
- **This repo is public.** That is a recorded decision: it is the publishing home for joey.ai. It is not a working repo that was opened by accident.
- **Personal and household data never reaches this repo.** Names of people, routines, health, location, household detail. A pack may know a person has a household. It may not describe the owner's.
- **The owner's other work never lives here.** No other project names, repo names, machine names, service inventories, or private paths. A stranger reading this repo meets only what it ships.
- **Topology is sensitive.** Machine maps and network inventories stay in the private projects that own them.

## Data
Taught skills and plugins. Marketplace metadata. A public contact email in `marketplace.json` (`joeyali@duck.com`), deliberate. No runtime secrets.

## Credentials
None. This repo has no credentials.

## Guardrails
- Sweep every artefact before it ships: personal paths, machine names, other projects, private services. None of it belongs in a taught file.
- The public copy is a new artefact. Promotion copies a cleaned version in; it does not retarget a private remote.
- History ships with the repo. If a forbidden fact lands, rotate what can be rotated and treat the commit as public forever.

## Before Teaching
1. Sweep the pack for facts, paths, and names a stranger should not need.
2. Record in the commit what was stripped.
3. Do not open a private project to "just copy the folder"; copy the cleaned artefact only.
