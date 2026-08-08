---
name: wrap-session
description: Close a working session in a vibe project — update every sister file the work touched, refresh Active State, append the Session Log, run the secrets check, commit and push to GitHub. Trigger on /vibe:wrap-session, "wrap the session", "close out", "wrap up" in any project carrying vibe sister files.
---

# vibe:wrap-session — nothing left behind

The end-of-session ritual from the canon (`${CLAUDE_PLUGIN_ROOT}/DESIGN.md` §3). Its whole job: the repo on GitHub ends the session as the complete, true record of the project.

## The ritual

**1. Doc sweep.** Walk what this session actually did and update every sister file it touched:
- behaviour or scope changed → `SPEC.md`
- how it's built changed, or a real finding landed → `ARCHITECTURE.md`
- look/feel/taste decision made → `DESIGN.md`
- idea raised but not committed to → `ENHANCEMENTS.md`
- anything credential- or privacy-shaped happened → `SECURITY.md`

Only files the work touched — a wrap that edits nothing but CLAUDE.md is fine when the session was small.

**2. CLAUDE.md.** Refresh Active State so it describes *now*, and append a dated Session Log entry: what happened, what it changed, what the next session starts with. If the session created or retired files, fix the file inventory.

**3. Secrets check — before staging.** `git diff` + untracked files: scan for anything credential-shaped (long literals assigned to key/token/secret/password names, `.env` content, `.pem`, `Bearer` strings, email/personal data in a repo that shouldn't carry it). Anything found: pull it out to the gitignored location per `SECURITY.md` *before* committing. This is the backstop; finding something here also means updating SECURITY.md so it can't recur.

**4. Commit and push.** One commit unless the session had genuinely separable pieces. Message says what the session did in plain words (`wrap: <what happened>` is a fine default). Push, and **verify the push landed** (`git status` shows clean and up to date with origin). Work that isn't on GitHub doesn't exist.

**5. Report.** Close with a plain summary: what shipped, which docs moved, the commit, and what the next session starts with. That last line should match what you just wrote in the Session Log.

## Rules

- Never skip the push. If the push fails (auth, network, diverged), fixing that *is* the remaining work of the session.
- Never commit around a secrets finding.
- If the session was cut short mid-work, wrap anyway — an honest "unfinished: X half-done, resume at Y" Session Log entry and a pushed WIP commit beat a dirty tree every time.
