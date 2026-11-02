---
name: adversarial-review
description: Implementer-versus-critic review for risky designs, specs, infrastructure, auth and security code. Use for gate G1 on a spec, or before merging anything security-sensitive.
argument-hint: "<file, folder or PR to attack>"
---

Run an adversarial review of: $ARGUMENTS

1. Dispatch the `sdd-team:adversarial-reviewer` subagent with the target and the relevant spec. It is read-only.
2. For each finding it returns, act as the implementer. Either concede and fix the problem, or rebut it with concrete evidence (a test, a code reference, a spec line). Opinions are not evidence.
3. Send the rebuttals back to the reviewer for one more round. A finding stays open until it is fixed or the critic accepts the evidence.
4. Report a table of each finding with its severity, its status (fixed, rebutted with evidence, or open), and a proof link or test name.
5. Post the table on the Linear issue. Any open Critical or High finding blocks the gate.
