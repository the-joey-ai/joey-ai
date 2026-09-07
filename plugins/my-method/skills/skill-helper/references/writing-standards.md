# Writing Standards

How to write skill content that performs. These standards are evidence-backed where evidence exists — the eval data is called out explicitly — and marked as judgment where it's judgment.

## What the data says

Skill-writing best practice has moved past folk wisdom; there are now published eval results. The findings that should shape every build:

- **The description drives everything.** Improving the description alone has produced ~50% gains in correct triggering. It's the only part of the skill the agent sees when deciding whether to load it. Most "broken" skills are broken here.
- **Detailed-and-compact beats comprehensive** by a wide margin (roughly 20 points in head-to-head evals). Give the agent the procedure and a couple of grounding examples, then stop. Exhaustive documentation actively hurts — the agent pursues instructions that don't apply to the task at hand.
- **Real expertise beats general knowledge.** A skill synthesised from your team's actual artifacts — style guides, incident reports, approved and rejected drafts, correction history — outperforms one synthesised from generic best-practice content. The value lives in what's specific to your team.
- **Explaining why outperforms rigid directives** for any task with tolerance for variation. An agent that understands the purpose behind an instruction makes better context-dependent decisions than one following a bare rule.
- **A single execute-then-revise pass noticeably improves quality.** The best skills aren't written; they're rewritten.

One honest caveat: these results come from a young eval ecosystem, mostly on coding-adjacent tasks. Directionally they're consistent across independent sources, which is why this skill encodes them — but treat magnitudes as indicative, not gospel, and let a skill's own test results override any general finding.

## The description: a routing rule, not a summary

Write the description for the trigger decision, not for a human browsing a catalogue. It needs four things:

1. **Verb + object for the job.** "Review a draft SEO brief before writing starts", not "helps with content".
2. **The phrases users will actually say.** Pull from Build Step 2's answers — casual phrasing, the slash command, the half-formed versions. Claude under-triggers skills, so be deliberately pushy: "use whenever the user mentions X, even if they don't explicitly ask for Y" fires more reliably than a neutral summary.
3. **Explicit exclusions.** Pushiness needs a counterweight or the skill hijacks adjacent requests. Name what the skill is *not* for and, where a neighbouring skill owns that territory, name the boundary: "Do NOT use for general document editing or spreadsheets — PDFs only."
4. **Hard dependencies**, if any: "requires the GitHub CLI."

Constraints: third person ("Reviews…", not "I review…"), and everything about *when to use* lives in the description — the body only loads after the routing decision is already made, so trigger guidance in the body is wasted.

One hard limit, learned from real use: **the description must be at most 1,024 characters — the installer enforces this and rejects the `.skill` at install time when it's over.** This is not a style guideline to aim near; it's a gate the bundle fails. Count the characters before packaging (`python3 -c "import yaml,sys; print(len(yaml.safe_load(open('SKILL.md').read().split('---')[1])['description']))"` or equivalent) and trim there — the user discovering the overrun in their install flow is the failure this check exists to prevent.

## Context economy

Once a skill fires, its whole SKILL.md body lands in context alongside the conversation, the system prompt, and every other active skill. Every token competes for attention.

- **Add what the agent lacks; omit what it knows.** The agent knows what a JD is, how email works, what a QBR is for. Write the parts it would get wrong: your standard, your structure, your naming, your historical mistakes. The per-line test: *would the agent get this wrong without this instruction?* No → cut.
- **Prefer one concrete example to three paragraphs of description.** Agents pattern-match against structures far better than they follow prose specifications.
- **If the skill adds nothing, say so.** When the agent already handles the task well bare, the honest recommendation is not building the skill — or retiring it. Preference skills (your team's way of working) are durable; capability skills (things the model can't yet do) have a shelf life, and the test loop's baseline comparison tells you when it has expired.

## Constitutional writing at skill scope

A skill is a constitutional document at the function scope, and the empirical findings above independently agree with the pattern — "explain the why" and "concise and earned" aren't philosophy competing with optimisation; they *are* the optimisation. Four practices:

1. **Explain reasoning, not just rules.** Every rule that has a why gets its why, in line: "keep bullets to 3–4 — hiring managers read JDs on phones, and longer lists get skipped." When the agent hits a case the rule didn't anticipate, the why is what lets it extrapolate correctly. If you find yourself writing ALWAYS or NEVER in caps, that's the signal to stop and write the reason instead — unless the constraint genuinely is non-negotiable, in which case say that and say why it is.
2. **Define the character of the function only.** The skill richly specifies what good output is, what standards it encodes, what its boundaries are. It never specifies who Claude is to the user — tone of collaboration, pushback style, relationship. That's inherited from the profile and project layers, and redefining it in a skill creates conflicts the user can't see or debug.
3. **Acknowledge evolution.** Name the owner of the standard the skill encodes ("this encodes the recruiting team's current job-description standard — they own it") and frame the standard as current, not permanent. This gives the skill a basis for flagging its own staleness and gives users somewhere to send feedback. A skill written as a final answer goes stale the day the standard moves, and nobody notices until the outputs are quietly wrong.
4. **Apply the deletion test before shipping.** Cut any sentence and ask whether behaviour changes. This is the same as rung 1 of the size ladder — run it even on skills that aren't oversized.

## Calibrating control

Match the specificity of instructions to the fragility of the task — and calibrate each section of the skill independently, because most skills mix both kinds of work.

- **Freedom where variation is tolerable.** Describe what to look for and why; let the agent pick the path. Dictating steps for judgment work removes the agent's ability to adapt and recover.
- **Prescription where consistency matters.** Compliance sequences, brand-mandated formats, destructive operations: spell them out exactly, and say they're exact. If the sequence is so fragile that reordering breaks it, that's a script, not prose (size ladder rung 3).
- **Defaults, not menus.** "Use pdfplumber; for scanned PDFs fall back to pdf2image" beats a list of four equal options. Menus force a re-decision on every run and produce inconsistent outputs across users.
- **Procedures, not answers.** Teach the approach to the class of problems ("read the schema, join on the `_id` convention, aggregate as requested"), not the answer to one instance ("join orders to customers and filter EMEA"). The first works every quarter; the second worked once.

## High-value patterns

Use the ones the skill's job calls for — none are mandatory.

- **Gotchas section.** The highest-value content per token in most skills: concrete, environment-specific facts that defy reasonable assumption. "The Customers object in HubSpot means companies — use Contacts for people." Not advice; corrections to mistakes the agent *will* make otherwise. Keep gotchas in SKILL.md, not a reference — the agent can't know to load a file for a trap it doesn't know exists. And this is the skill's living edit surface: every correction the owner makes in real use becomes a new gotcha line. It's the single fastest way a skill improves.
- **Output templates.** For any required format, give the literal template, not a prose description of it. Short templates inline; long or situational ones in `assets/`.
- **Checklists.** For multi-step workflows with dependencies or do-not-ship gates, an explicit checkbox list keeps the agent from skipping steps.
- **Validation loops.** "Do the work → check it against [script / reference / criteria] → fix → repeat until clean." A reference doc can be the validator.
- **Plan-validate-execute.** For batch or destructive operations: produce a structured plan, validate it against the source of truth, only then execute. The validation step is the ingredient that lets the agent self-correct instead of failing downstream.
- **Failure paths.** Say what to do when reality is messy: required file missing → report `blocked` and name the path; sources disagree → show both; command fails → include the command and stderr; task expands beyond scope → finish the in-scope part and name the rest. Most bad runs aren't capability failures; they're the skill never having said what to do when things went sideways.

## Language

- **Imperative instructions.** "Always use `interactions.create()`", not "the interactions API is the recommended approach." The first is an instruction; the second is trivia the agent won't act on.
- **Examples of good *and* bad.** A bad example with a one-line "why it fails" teaches boundary judgment that good examples alone can't.
- **No AI tells.** The skill's own prose — and the outputs it specifies — must not read machine-generated: no "It's important to note", no "delve", no formulaic intros, no hedge-stacking, no bullet-point walls where prose carries the relationship between ideas. A skill that writes in tells produces outputs in tells, at scale.
- **Write for the model, not the reader.** A SKILL.md is an operating document. Headers and structure serve navigation under pressure, not presentation. If a section exists to look thorough rather than to change behaviour, cut it.
