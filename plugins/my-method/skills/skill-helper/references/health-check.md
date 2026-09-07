# Health Check
A quality and readiness self-assessment for any skill. Run it before a skill ships to anyone but its builder, at the end of every improve pass, or whenever the owner wants an honest read on whether the skill is actually good.

Walk every check in order. For each, record **Pass**, **Fix**, or **N/A** with a one-line note. Don't soften a Fix into a Pass-with-caveats — the whole value of the self-check is honesty before someone else finds it.

## The Checks
### 1. Description Accuracy
Read the description, then the full bundle. Does the description accurately represent what the skill does and when it triggers? A mismatch here — the skill doing more, less, or different than the description claims — is the first thing any reviewer or new user hits, and it's a red flag before anything runs.

### 2. Trigger Scope
Is the description specific enough that it won't fire on unrelated prompts, and pushy enough that it fires on the real ones? Check that it contains: the job (verb + object), the phrases users actually say, and explicit exclusions for adjacent territory. Check the length too — the installer hard-caps descriptions at 1,024 characters and rejects longer ones at install time. Trigger evidence must come from an **installed** test — the pack pulled on a platform and prompted in fresh chats, including at least one off-target near-miss that stays quiet (see `references/testing.md`, Step 3). A description-only proxy read is a weak signal, not a Pass; if the installed test hasn't been run, this check is a Fix, not a Pass.

### 3. Surprise Check
Anything in the bundle a reader of the description wouldn't expect? Tool or MCP access the job doesn't obviously need, instructions out of scope for the stated purpose, data access beyond the stated boundary, anything that sends communications or modifies files the description doesn't mention. The standard is lack of surprise: a user who read only the description should never be surprised by what the skill does. For any skill that runs unattended this check is non-optional — a surprise that's harmless with the owner watching is harmful on a schedule.

### 4. Self-containment
Run the audit from `references/architecture.md`: no paths pointing outside the bundle, no orphaned files, external services named with absent-behaviour defined, nothing writing state into the skill's own folder. A skill that only works on the author's machine breaks on every other one, and in the cloud.

### 5. Functional
Has the skill passed the real-use loop at the tier its seat demands? The two-or-three-prompt loop is the bar for a skill the owner triggers; a skill that runs unattended or ships to others meets the escalated one — 5–8 realistic on-target prompts and 3–4 near-misses (see `references/testing.md`, "When to add rigor"). "It worked when I tried it once" is not evidence; nondeterminism means a single pass proves little. If the loop hasn't been run at the right tier, record Fix here and continue; if it cannot run in this session (read-only, a missing service, side effects), say so in the note.

### 6. Intention
The harder question, asked separately from #5: does the output genuinely serve the goal the skill was built for? Would the owner use the test outputs unedited? A skill that works mechanically but produces mediocre output fails this check — and mediocre on repeat is worse than no skill, because it sets the bar and anchors there.

### 7. Quality Bar
Is this good enough for every seat that will trigger it? Different from #6 in audience: intention asks whether the output serves the owner's goal; quality asks whether an agent with far less context — a cloud session that cannot see the owner's machine, a colleague's install — gets output the owner would stand behind. Read the outputs as a stranger would.

### 8. Evolution
Does the skill name the owner of the standard it encodes, and frame that standard as current rather than permanent? Is there a feedback path? A skill with no owner goes quietly stale, and stale skills produce confidently wrong output — the worst failure mode, because nothing looks broken.

## The Readiness Report
Produce this at the end of every health check:

```markdown
# Health Check — [skill-name]
[date, ISO format]

| # | Check                | Result | Note |
|---|----------------------|--------|------|
| 1 | Description accuracy | Pass   |      |
| 2 | Trigger scope        | Fix    | [what and why] |
| 3 | Surprise check       | Pass   |      |
| 4 | Self-containment     | Pass   |      |
| 5 | Functional           | Pass   |      |
| 6 | Intention            | Pass   |      |
| 7 | Quality bar          | Pass   |      |
| 8 | Evolution            | Fix    | [what and why] |

**Verdict: [Ready / Fix first]**

[If Fix first: the fix list, ordered by effort, each item specific enough
to act on without re-running the whole check.]
```

**Ready** requires every check at Pass or N/A. One Fix means fix first — the wider the audience, the more a shipped flaw costs relative to the fix.

