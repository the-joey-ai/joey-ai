# Instantiating a vibe template

The single contract for turning any template in this folder into a real project document. Every vibe skill that writes a document follows this file — it exists once so the rules cannot drift between skills.

## The rules

1. **Fill every `{{token}}`.** Prose tokens ({{north-star}}, {{character-paragraph}}) are written in Joey's own words, from the conversation — never invented on his behalf and read back when they carry weight.
2. **Strip every comment marked `guidance`.** `<!-- guidance: ... -->` is instruction to you, the filling skill. None of it survives into the instantiated document.
3. **Keep every plain comment.** An unmarked `<!-- ... -->` is content — instructions future sessions need, like a session-log format or an archive rule. Stripping one deletes part of the system.
4. **Delete any repeatable stanza you have no content for.** Several templates carry a heading-plus-content pair meant to be copied per item (`### {{platform}}`, `### {{area}}` / `- [ ] {{check}}`) or dropped entirely. A leftover `{{platform}}` in a finished document is worse than a missing section — the next session reads it as content.
5. **Placeholders like `_Empty._` and `_Nothing yet._` are correct content** for a section with nothing in it yet. Leave them; replace them when the first real entry arrives — never leave one sitting above a real entry.
6. **Tidy the seams.** Stripping comments can leave stacked blank lines; collapse runs of three or more newlines to two.

## Verify before moving on

Run the bundled checker on every document you instantiated:

```bash
bash <plugin-root>/scripts/verify-doc.sh <file> [...]
```

(From inside a skill folder, the plugin root is `../..`.) It reports any unfilled `{{token}}` or surviving `guidance` comment with file and line, and exits non-zero if it finds either. It is deliberately dumb and exact — the two mistakes it catches are the two that are invisible to a quick read and embarrassing in a document you trust later.

If the script cannot run for any reason, do the same two checks by hand — search the file for `{{` and for `<!-- guidance` — and say that you verified manually.
