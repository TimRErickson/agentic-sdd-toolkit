# sdd-team

Team skills, agents and hooks for agentic Spec-Driven Development in Claude Code.

Skills: preflight (readiness check), sdd-status (SDD orchestrator), linear-task
(ticket claim to pull request), change-control, tests-audit (mutation testing),
adversarial-review, and landing-the-plane (mandatory session close-out).

Agents: adversarial-reviewer and spec-compliance-reviewer, both read-only.

Hooks: inject team conventions at session start; block force-push, --no-verify,
git add -A, edits to secrets and lockfiles, and terraform apply/destroy.

Setup: requires jq, and run Claude Code in WSL 2, Linux or macOS. Install with
claude plugin marketplace add <your-github-user>/agentic-sdd-toolkit, then
claude plugin install sdd-team@agentic-sdd-toolkit.
