<!-- guidance: written fresh for each phase by /vibe:start-session, and kept honest during the
     session. Strip guidance comments; keep plain ones. -->

# Spec — {{phase-name}}

{{goal}}

<!-- guidance: one or two sentences on what this phase is for. A phase is a chunk of work with a
     definable finish, not a whole version — "the vendor list page works end to end" rather than
     "build the tool". -->

**Started:** {{date}}

## What done means

{{done-criteria}}

<!-- guidance: observable statements, each confirmable by using the thing. If you cannot tell
     whether it is done by using it, rewrite it until you can. This section is what stops a
     phase drifting, and it is what /vibe:start-session reads back at the top of the next
     session. -->

## Steps

{{steps}}

<!-- guidance: ordered, and small enough that one session moves several. Check them off as they
     land. Where a step genuinely depends on the one before it, keep the order; where it does
     not, say so — a session that wrongly believes it is blocked will stop and ask. -->

## Progress notes

{{progress}}

<!-- guidance: the honest state, updated as work happens and trued up by /vibe:wrap-session.
     Half-done is the most valuable thing recorded here: "the search box filters, but sorting is
     still fake data" tells the next session exactly where to pick up, where a checked box tells
     it nothing. Write what is real, including what is broken. -->

## How we'll verify

{{verification}}

<!-- guidance: what actually gets run or clicked to prove this phase works — name the commands
     and the screens. For anything visual, run the verification checklist at the bottom of
     DESIGN.md; being binary is what makes it worth running. -->

<!-- When this phase finishes, /vibe:start-session copies this whole file to the top of
     docs/spec-history.md — newest first — and writes a fresh SPEC.md for the next phase. That
     history is what makes it safe to throw this one away. -->
