---
name: linear-task
description: Drive one Linear issue from claim to pull request, logging decisions on the ticket. Use when the engineer names a Linear issue ID or URL to work on.
argument-hint: "<Linear issue ID or URL>"
disable-model-invocation: true
---

Work Linear issue $ARGUMENTS end to end. Use the Linear MCP tools for every ticket action.

1. Claim: read the issue, assign it to me, set status to In Progress. Post a comment: "Started by Claude Code on branch <branch>".
2. Branch: create a branch named from the issue's suggested git branch name (or `<id>-<short-slug>`).
3. Spec check: find the matching spec under `specs/`. If there is none, stop and ask whether to run `/speckit-specify` first. Small bug fixes may skip the spec but still need a failing regression test first.
4. Build with TDD: for each acceptance criterion, write a failing test, watch it fail, write the minimum code, watch it pass, refactor. Follow AGENTS.md.
5. Verify locally: `make check` and `make unittest` must pass. Commit with a message that starts with the issue ID. Stage files by name.
6. Decisions: whenever you choose between options, post a decision comment on the issue: what was chosen, what was rejected, and why.
7. Open a draft PR with `gh pr create --draft`. Put the issue ID in the title and link the PR on the issue.
8. Stop and report: summary, test results, PR link, open questions. Do not mark the issue Done; that happens after merge in `/sdd-team:landing-the-plane`.
