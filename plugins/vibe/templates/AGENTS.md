<!-- guidance: instantiated by /vibe:new-project. Nothing to fill — copy it as-is, stripping
     this comment.

     One exception, and it is common: if an AGENTS.md already exists carrying a tool-managed
     block — framework scaffolders write these, marked with BEGIN/END comments like
     `<!-- BEGIN:nextjs-agent-rules -->` — do not delete it. That block may be regenerated,
     so removing it starts a fight you lose silently. Keep it, add the pointer text above it,
     and note that it is tool-managed. Then restate anything load-bearing from it in
     CLAUDE.md's house rules, so the instruction survives whether or not the block does. -->

# Agent instructions

Read `CLAUDE.md` in this folder. It is the single set of instructions for this project, whatever tool you are, and it is the only one kept current.

This file stays a pointer on purpose. Keeping two instruction files in step is a job nobody does reliably, and the failure is silent — the stale one gets followed.
