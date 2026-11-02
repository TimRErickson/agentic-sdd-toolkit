---
name: preflight
description: Session-start readiness check of git state, toolchain, GitHub auth, MCP connectors, Docker and disk. Use at the start of a work session or when something in the environment seems broken.
argument-hint: "[--quick]"
allowed-tools: Bash(bash *)
---

Run the readiness script and report the results as a short checklist.

!`bash "${CLAUDE_SKILL_DIR}/scripts/preflight.sh" $ARGUMENTS`

Then:
1. Summarize: one line per check, marked PASS, WARN or FAIL.
2. For every FAIL, give the exact command that fixes it (from the setup guide).
3. Remind the engineer to run `/mcp` if Linear is not listed as connected.
4. If everything passes, say "Ready" and suggest the next step: `/sdd-team:sdd-status`.
Do not change anything yourself.
