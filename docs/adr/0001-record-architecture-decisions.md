# 1. Record architecture decisions

- Status: accepted
- Date: 2026-10-24

## Context
SilverTimer's decisions lived in commit messages, `CLAUDE.md` and the README. The sibling projects Tideline and FoxGrid record
significant decisions as ADRs, which makes it quick to see why something is the way it is and to keep the three projects set up
alike.

## Decision
Every significant decision gets a short ADR in `docs/adr/NNNN-title.md`, based on [0000-template.md](0000-template.md), numbered
in order and never rewritten: a changed decision gets a new ADR that supersedes the old one. ADRs 0002 to 0010 were written
retroactively on the date above for decisions that were already in place; their rationale comes from the code and the git history.

## Consequences
- A small amount of writing per decision, in return for a searchable history.
- `CLAUDE.md` stays a short rule list and links here for the reasons.
