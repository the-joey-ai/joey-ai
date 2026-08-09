<!-- guidance: instantiated by /vibe:new-project, derived from the master at
     ~/Claude/my-design/DESIGN.md. Strip guidance comments; keep plain ones. -->

# Design — {{project-name}}

{{one-line-summary}}

<!-- guidance: what this project's design is in one line, plus the stack it is built on — for
     example "web adaptation of the master editorial system; Next.js, Tailwind, shadcn". Then
     add the tie-breaker sentence: what to prefer when a decision is genuinely ambiguous
     ("prefer fewer containers, more whitespace, serif headings"). That one sentence settles
     more questions than any individual rule below it. -->

This is the single reference for every layout, type, colour, spacing, and interaction decision in this project.

## Derived from

`~/Claude/my-design/DESIGN.md`, on {{date}}.

{{translation}}

<!-- guidance: what carried over unchanged, and what had to be translated because this platform
     works differently. Write the translations as explicit pairs — "tab bar → top nav, floating
     action button → primary button, sheets → dialogs, system serif → a web serif" — and say
     plainly that the philosophy is unchanged and only the mechanics moved. This paragraph is
     what stops a later session either ignoring the master or lifting something from it that
     makes no sense here. It is also what makes harvesting possible: a translation that worked
     well is exactly the kind of thing the master wants back. -->

## {{section-name}}

{{section-content}}

<!-- guidance: repeat the heading-and-content pair above once for each part of the design this
     project actually has. The usual set, in this order: Colour, Typography, Layout, Spacing,
     Navigation, The primary action, Dialogs, Icons, Charts, Motion. Most projects need five or
     six of them.

     Take the Signature from the master and restate it concretely for this platform, with real
     values rather than principles: the hex, the class, the pixel gap. A rule a session cannot
     check is a rule it will not follow — so prefer a table of exact values over a paragraph
     describing an intention.

     Do not invent sections for parts of the design this project does not have; a tool with no
     charts needs no charts section. Delete this guidance block and any unused heading pair
     before saving. -->

## Do / Don't

| Do | Don't |
|---|---|
| {{do}} | {{dont}} |

<!-- guidance: carried from the master's table, plus anything specific to this project. Keep it
     scannable — this is the part that gets read in a hurry. -->

## Project-specific decisions

{{project-decisions}}

<!-- guidance: taste decided here that the master does not cover — a component pattern this
     project needed, a colour meaning invented for it, a layout question the master had no view
     on. Every entry is a harvest candidate: /vibe:wrap-session asks whether it should travel
     back up to the master, and this is the section it reads. -->

## Verification checklist

Binary — each item passes or it does not. Run before calling any screen done.

<!-- guidance: group by area (colour, typography, layout, navigation and surfaces, motion),
     because grouped checks get run and a flat list of thirty does not. Every item must be
     settleable by looking at the screen or the code, and phrased so the answer is yes or no.
     "Spacing feels right" is not an item; "32px between major sections" is. Derive these from
     the Do/Don't table and the concrete values above — anything that matters enough to state
     as a rule matters enough to check. -->

### {{area}}
- [ ] {{check}}
