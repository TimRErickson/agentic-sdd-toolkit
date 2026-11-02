---
name: change-control
description: Log, classify and route a scope change discovered during planning or build, then update the spec before work continues. Use whenever implementation reveals a gap, nuance, or new requirement that the spec does not cover.
argument-hint: "<what was discovered>"
---

A change was discovered: $ARGUMENTS

1. Stop implementation work on the affected task.
2. Log it: post a comment on the Linear ticket titled "Change request" describing what was found, where, and the evidence.
3. Classify it as one of:
   - CLARIFICATION: the spec is ambiguous but the intent is clear. No change to scope, time or risk.
   - SCOPE CHANGE: new or different behavior, more work, or new risk.
4. Decide:
   - CLARIFICATION: propose the exact wording change to spec.md, and apply it after the engineer agrees.
   - SCOPE CHANGE: present options (do it now, defer it to a new ticket, or drop it) with the impact of each. The tech lead decides, and the client too if scope moves. Wait for the decision.
5. Update and resume: edit spec.md, then plan.md and tasks.md if affected (use `/speckit-specify` or `/speckit-plan` to update), and run `/speckit-analyze`. Append an entry to `specs/<feature>/changes.md` (date, change, class, decision, who decided). Post the decision on the ticket. Create a follow-up ticket for deferred work.
6. Only then continue implementation.
