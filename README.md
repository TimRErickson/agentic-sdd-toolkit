# agentic-sdd-toolkit

A Claude Code plugin marketplace with one plugin, `sdd-team`. It adds the team layer for agentic Spec-Driven Development: a readiness check (`preflight`), an SDD orchestrator (`sdd-status`), a Linear ticket loop (`linear-task`), `change-control`, a mutation-testing `tests-audit`, a read-only `adversarial-review`, and the mandatory `landing-the-plane` close-out. It also adds guardrail hooks that inject team conventions at session start and block force-pushes, `--no-verify`, `git add -A`, edits to secrets and lockfiles, and `terraform apply`.

Install:

    claude plugin marketplace add <your-github-user>/agentic-sdd-toolkit
    claude plugin install sdd-team@agentic-sdd-toolkit

Requires `jq` on PATH. The hooks are bash scripts, so run Claude Code in WSL 2, Linux or macOS.
