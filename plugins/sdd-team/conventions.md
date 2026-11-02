TEAM CONVENTIONS (injected at session start by the sdd-team plugin)
1. The ticket (Linear issue) is the system of record. Post every finalized decision as a comment on the ticket, never only in chat or in CLAUDE.md / AGENTS.md.
2. Spec first: no code without an approved spec in specs/<feature>/ (spec.md, plan.md, tasks.md). If building reveals a change, run /sdd-team:change-control before continuing.
3. Tests first: RED -> GREEN -> REFACTOR. Every bug fix gets a regression test. User-facing features get end-to-end tests.
4. One story per pull request. Small, reviewable changes.
5. Repos expose make dev, make check, make unittest, make coverage. Run make dev on its own first.
6. Never bypass hooks (--no-verify). Never force-push. Stage files by name, never git add -A or git add . (another agent may be working in the same tree).
7. Never read or write secrets (.env files, keys). Never name one client in another client's materials.
8. A session is not finished until /sdd-team:landing-the-plane has run and git push has succeeded.
