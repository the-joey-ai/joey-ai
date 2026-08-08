# SECURITY.md — {{PROJECT_NAME}}

<!-- The secrets contract. Exists in EVERY project, even docs-only ones — "nothing sensitive here" is itself a statement worth making explicitly. -->

## What may never be committed

<!-- The concrete list for this project: key names, file patterns, data classes (family emails, network topology, ...). The wrap-session secrets check enforces this list. -->

## Where credentials actually live

<!-- Each credential the project uses, BY NAME ONLY, and its real location (gitignored env file, keychain, service config). Never the value. Example: "READARR_API_KEY — in ./secrets.env (gitignored); consumed by scripts/books/*". -->

## .gitignore contract

<!-- What the .gitignore covers and why. If a new secret location appears, it lands here AND in .gitignore in the same session. -->

## Privacy posture

<!-- Repo visibility (private/public) and what that decision protects. Any personal/family data the project touches and how it's kept out of the repo. If a secret ever lands in git history: rotate it, don't just remove it. -->
