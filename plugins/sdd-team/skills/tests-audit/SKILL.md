---
name: tests-audit
description: Prove the tests are real and sufficient using mutation testing and a spec-to-test trace. Use at the end of a ticket, before asking for human approval.
argument-hint: "[source path, default src/]"
---

Audit the tests for the current change. Do not weaken or delete existing tests.

1. Trace: list every acceptance criterion in the feature's spec.md and the test(s) that prove it. Flag any criterion with no test.
2. Mutate: run `uv run mutmut run` (configured in pyproject.toml), then `uv run mutmut results`.
3. For each surviving mutant in the changed code: show the mutation (`uv run mutmut show <id>`), explain which behavior is unprotected, and write a test that kills it. Confirm the new test fails against the mutant and passes against the real code.
4. Ignore surviving mutants in logging or messages only if you explain why.
5. Re-run `make unittest` and `make coverage`.
6. Report on the ticket: mutants created / killed / survived, tests added, and the criteria-to-test trace.
