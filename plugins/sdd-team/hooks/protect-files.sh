#!/bin/bash
# PreToolUse hook for Edit|Write: block edits to secrets, git internals and lockfiles.
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
NAME=$(basename "$FILE_PATH")

case "$NAME" in
  *.example|*.sample) exit 0 ;;
  .env|.env.*|*.pem|*.key|id_rsa*|id_ed25519*)
    echo "Blocked by sdd-team guard: $FILE_PATH looks like a secret. Ask the engineer to edit it." >&2; exit 2 ;;
  uv.lock|package-lock.json|pnpm-lock.yaml|yarn.lock)
    echo "Blocked by sdd-team guard: regenerate lockfiles with the tool (e.g. uv lock), never hand-edit $NAME." >&2; exit 2 ;;
esac
if [[ "$FILE_PATH" == *"/.git/"* ]]; then
  echo "Blocked by sdd-team guard: never edit files inside .git/." >&2; exit 2
fi
exit 0
