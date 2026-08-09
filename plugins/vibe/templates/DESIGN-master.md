<!-- guidance: created and grown by /vibe:my-design. Lives at ~/Claude/my-design/DESIGN.md,
     its own private repo. Strip guidance comments on first write; keep plain ones. -->

# Joey's design

The way Joey's things look and feel. Written once, grown from every project after.

Every project derives from this file: `/vibe:new-project` takes the Signature wholesale plus the Execution notes for that project's platform, then writes the project's own `DESIGN.md` with a verification checklist. This file is the reason a second project looks like it came from the same hands as the first.

<!-- Two layers, and the split is load-bearing. Signature is taste, and it travels
     everywhere. Execution notes are how that taste gets built on one particular platform,
     and they do not travel — a SwiftUI snippet has no business in a web project. Keeping
     them apart is what makes derivation a clean lift rather than a copy that has to be
     edited down. -->

## Harvest inbox

<!-- Learnings waiting to be absorbed. /vibe:wrap-session appends here when a project teaches
     something about taste; /vibe:my-design processes and clears it. Empty is the normal
     state, not a gap. -->

_Empty._

---

## Signature

### References

{{references}}

<!-- guidance: the two or three things this taste comes from — apps, sites, products — and for
     each, what specifically is admired. "I like Things 3" is not usable. "Things 3, for how
     much empty space sits around a single task, and that nothing animates unless you acted"
     is. Push for the observable thing every time. This section is what a later session
     reasons from when the rules below do not cover the case in front of it. -->

### Colour

{{colour}}

<!-- guidance: philosophy first, then real values where they exist. Where the accent may and
     may not appear is usually the highest-value rule in the whole file — most designs come
     apart by letting the accent become decoration. Say what backgrounds are and what they are
     never; "not pure white" and "not pure black" are the common answers and both matter. -->

### Typography

{{typography}}

<!-- guidance: the stance — what headings are, what body text is, what numbers and code are,
     and why. Name specific families where they exist, and give the reasoning where they do
     not, so a project on an unfamiliar platform can choose an equivalent instead of
     guessing. -->

### Layout

{{layout}}

<!-- guidance: how content is organised and what does the separating — space, hairlines, or
     boxes. The recurring question is whether things sit inside containers or flow
     continuously; answer it explicitly, because it is the decision every screen inherits. -->

### Motion

{{motion}}

<!-- guidance: how much, where, and where never. "Restrained" alone is not actionable — name
     what is allowed and what is banned. -->

### Do / Don't

| Do | Don't |
|---|---|
| {{do}} | {{dont}} |

<!-- guidance: the hard rules as pairs. This table is the most portable thing in the file — it
     is what becomes a project's verification checklist. Each row should be settleable by
     looking at a screen. -->

---

## Execution notes

<!-- Platform-specific recipes — code, component patterns, exact values that only mean
     something on one platform. One heading per platform, added the first time a project
     builds there. Derivation takes only the matching platform's section, so a project never
     inherits instructions for a platform it is not on. Anything that would be wrong on a
     different platform belongs here rather than in the Signature above, even when it feels
     like taste. -->

### {{platform}}

{{platform-notes}}
