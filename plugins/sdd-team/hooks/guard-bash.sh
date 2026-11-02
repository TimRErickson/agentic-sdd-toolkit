#!/bin/bash
# PreToolUse hook for Bash: exit 2 blocks the command and tells Claude why.
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

block() { echo "Blocked by sdd-team guard: $1" >&2; exit 2; }

[[ "$CMD" =~ --no-verify ]] && block "do not bypass git hooks (--no-verify). Fix the failing check instead."
[[ "$CMD" =~ git[[:space:]]+push.*(--force|-f([[:space:]]|$)) ]] && block "force-push is not allowed. Rebase and push normally, or ask the engineer."
[[ "$CMD" =~ git[[:space:]]+add[[:space:]]+(-A|--all|\.)([[:space:]]|$) ]] && block "stage files by name (git add path/to/file). Another agent may be working in this tree."
[[ "$CMD" =~ rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f?[[:space:]]+(/|~|\$HOME)([[:space:]]|$) ]] && block "recursive delete of a root or home directory."
[[ "$CMD" =~ terraform[[:space:]]+(apply|destroy) ]] && block "agents may plan infrastructure but never apply or destroy it. Hand the plan to the engineer."
exit 0
