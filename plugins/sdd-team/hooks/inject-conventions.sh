#!/bin/bash
# SessionStart hook: whatever this prints (exit 0) is added to Claude's context.
cat "${CLAUDE_PLUGIN_ROOT}/conventions.md"

# Show where the project stands in the SDD pipeline, if it uses Spec Kit.
if [ -d "specs" ]; then
  echo ""
  echo "SDD FEATURES IN THIS REPO:"
  for d in specs/*/; do
    [ -d "$d" ] || continue
    s="spec"; [ -f "$d/plan.md" ] && s="plan"; [ -f "$d/tasks.md" ] && s="tasks"
    echo "  - ${d%/} (furthest artifact: $s)"
  done
fi
exit 0
