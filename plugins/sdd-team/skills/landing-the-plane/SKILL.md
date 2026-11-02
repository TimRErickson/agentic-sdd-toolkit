---
name: landing-the-plane
description: Mandatory session close. Files follow-ups, runs the gates, records decisions on the ticket, archives lessons, pushes and cleans up. Use at the end of every work session and after every merge.
disable-model-invocation: true
---

Close out this session. Work through every step and report each one as done or blocked.

1. Follow-ups: create a Linear issue for anything left over (deferred scope, TODOs you added, flaky tests). Link each one to the current issue.
2. Gates: run `make check`, `make unittest` and `make coverage`. If any fail, fix them or report them as blocked. Never skip this.
3. Decisions: post a final decision comment on the Linear issue covering what changed, the key decisions, and anything a teammate must know.
4. Knowledge: append the lessons and decisions to `docs/decisions/log.md`, dated and with the issue ID. If a decision is architectural, add an ADR file under `docs/decisions/`.
5. Push: commit by file name and run `git push`. The session is not finished until the push succeeds.
6. Ticket: if the PR is merged, set the issue to Done. Otherwise leave it In Review with the PR linked.
7. Clean up: delete merged local branches (`git branch --merged main | grep -v ' main$' | xargs -r git branch -d`) and remove finished worktrees (`git worktree prune`).
8. Hand off: finish with a five-line summary covering where things stand, what's next, and any blockers.
Done means: the PR is merged, the issue is closed with its decisions recorded, and `git status` says the branch is up to date with origin.
