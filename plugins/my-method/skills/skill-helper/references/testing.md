# Testing
The real-use test loop. Light enough that non-technical builders actually run it, honest enough to catch both failure modes: *doesn't work* and *works but misses the intention*.

## Why Test at All
Agent output is nondeterministic — a skill that worked once hasn't been shown to work. And the second failure mode is invisible without testing: a skill can fire cleanly, execute cleanly, and still produce output that doesn't serve the goal it was built for. That one looks like success from the outside and does the most damage at scale. In the eval data, a single execute-then-revise pass is the biggest single quality lever; this loop is built around exactly that.

## Step 1: Write the Prompts
Design **two or three on-target prompts** plus **one off-target near-miss**, and get the user's sign-off before running — the owner knows how the prompts will actually be phrased.

On-target prompts must be realistic, not ideal. Real users write casually, with context and clutter: file names, half-remembered details, typos, backstory. "Wrap the session" tests nothing; "ok done for today, the importer worked but I moved the compose file and didn't push, can you bank it" tests the skill. Vary the phrasings — one formal, one casual, one that needs the skill without naming it.

The off-target prompt is the important one most builders skip. Make it a genuine near-miss — shares keywords or territory with the skill but should be handled *without* it ("write the project description for the settings page" against skill-helper; "what did we decide about the importer" against wrap-session). An obviously irrelevant prompt tests nothing. A skill that hijacks adjacent requests fails at scale even when every happy-path run is perfect.

## Step 2: Write Success Criteria Before Running
One or two lines per prompt, written down before any run: what must be true of the output for this to count as a pass? Criteria should be checkable ("all four sections present, AI statement verbatim, no internal level codes") not vibes ("output is good"). Grade outcomes, not paths — the agent taking an unexpected route to a correct result is fine; a wrong result via the expected route is not.

Criteria written after seeing the output get bent to fit the output. Write them first.

## Step 3: Run — and Be Honest About What Each Run Proves
A skill under construction is a folder in the workspace, not an installed skill. That means build-time runs can test how the skill **executes**, but they cannot prove **triggering** — whether the skill fires at all is a routing decision made against the installed description in a real session, and no simulation of it counts as evidence. Split the two honestly:

**Execution and intention — testable now:**

- **With subagents (Claude Code, Cursor, Codex):** dispatch each on-target prompt to its own subagent in the same turn, instructing it to read the skill folder's SKILL.md and follow it as its operating instructions for the task. Clean context, and the runner didn't write the skill — honest evidence for execution quality.
- **Without subagents:** run each prompt yourself, following the skill's instructions as written — not as intended. Say plainly this is weaker evidence (author and tester share a context).

**Triggering and off-target — only provable installed:** the real test is pushing the pack, pulling it on the platform, and running the on-target and off-target prompts in fresh chats. Until that's happened, never report a trigger or off-target result as a pass — say plainly that it's untested. If the user wants an early signal, one weak proxy exists: give a fresh subagent only the frontmatter description plus the test prompt and ask whether it would load that skill for that task. Label it a proxy in anything you report; it approximates the routing decision, it isn't one.

## Step 4: Read the Traces, Not Just the Outputs
The output tells you *whether* it worked; the trace tells you *why* and *what to fix*. Look for:

- **Wandering** — the agent tries several approaches before finding one. The instructions are too vague, or there's a menu where there should be a default.
- **Detours** — the agent follows instructions that don't apply to this task. The skill is too comprehensive; cut or move to conditional references.
- **Reinvention** — every run independently builds the same helper logic. That logic wants to be a bundled script.
- **Ignored instructions** — the agent skims past something you wrote. Usually it's phrased as trivia rather than an instruction, or it's buried mid-paragraph. Reword imperatively or move it.
- **Improvised gaps** — the agent hit a situation the skill never addressed and guessed. Add the failure path or the gotcha.

## Step 5: Grade Both Failure Modes
For each on-target run, two separate questions:

1. **Did it work?** Triggered, executed, produced output meeting the written criteria.
2. **Is it genuinely good?** Would the owner use this output unedited? If the answer is "it's fine, I'd tweak it" — that's a fail at scale. Mediocre output on a skill that fires every day sets the bar low and anchors there. Don't average the two questions; a skill must pass both.

## Step 6: Revise Once, Then Re-run What Failed
Fold everything the traces surfaced into one revision pass — reworded instructions, new gotchas, cut content, a script if reinvention showed up. Then re-run the prompts that failed (and the off-target if the description changed). One full pass is the minimum; stop when the prompts pass both grades and nothing new is surfacing, not when the process feels long enough.

If a prompt fails the same way twice, don't add a harder rule — reframe. Repeated failure against a strengthening instruction usually means the instruction is fighting the skill's structure, not the agent's attention.

## When to Add Rigor
The loop above is right-sized for skills the owner triggers themselves. Escalate when the stakes do:

- **Skills that run unattended or ship to other people:** grow to 5–8 on-target prompts across the real range of phrasings and 3–4 near-misses, and run the health check (`references/health-check.md`) before the skill ships. Nobody is there to correct it mid-run.
- **Flaky-seeming prompts:** agent output is nondeterministic, so a prompt that fails once and passes once has told you nothing. Run it 3–5 times and read the distribution before deciding whether the skill or the prompt is the problem.
- **When it's unclear the skill adds value:** run one on-target prompt with the skill and once bare, and compare. If the bare run matches, the skill isn't earning its context — tighten its scope to what the model actually gets wrong, or question whether it should exist.
- **Skills with deterministic outputs** (file transforms, data extraction): write the checks as small scripts and run them each iteration — cheaper and more reliable than eyeballing.
- **The retire check:** occasionally run an on-target prompt *without* the skill. If the bare model now matches the skill's output, the skill has been absorbed and is pure maintenance cost — recommend retiring it. This applies to capability skills; preference skills (the owner's way of doing things) don't expire this way.
