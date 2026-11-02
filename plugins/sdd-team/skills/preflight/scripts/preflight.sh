#!/bin/bash
# Read-only readiness check for WSL 2 (Ubuntu). Prints PASS/WARN/FAIL lines.
QUICK=0; [ "$1" = "--quick" ] && QUICK=1
ok()   { echo "PASS  $1"; }
warn() { echo "WARN  $1"; }
fail() { echo "FAIL  $1"; }

grep -qi microsoft /proc/version 2>/dev/null && ok "running inside WSL" || warn "not running inside WSL"
case "$PWD" in /mnt/*) warn "project is on the Windows drive ($PWD); move it under ~/code for speed";; esac

for t in git gh uv jq make specify; do
  if command -v "$t" >/dev/null 2>&1; then ok "$t installed"; else fail "$t not found on PATH"; fi
done
command -v node >/dev/null 2>&1 && ok "node $(node --version)" || warn "node not found (needed for npx-based tools)"

if gh auth status >/dev/null 2>&1; then ok "GitHub CLI authenticated"; else fail "GitHub CLI not authenticated (run: gh auth login)"; fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  ok "inside git repo on branch $(git branch --show-current)"
  [ -z "$(git status --porcelain)" ] && ok "working tree clean" || warn "uncommitted changes present"
  if git fetch -q 2>/dev/null; then
    behind=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "?")
    [ "$behind" = "0" ] && ok "up to date with upstream" || warn "behind upstream by $behind commit(s), or no upstream set"
  fi
  [ -f "$(git rev-parse --git-path hooks)/pre-commit" ] && ok "git pre-commit hook installed" || warn "git hooks not installed (run: lefthook install)"
  for f in AGENTS.md CLAUDE.md Makefile; do [ -f "$f" ] && ok "$f present" || warn "$f missing"; done
  [ -d .specify ] && ok "Spec Kit initialized" || warn "Spec Kit not initialized (run: specify init --here --integration claude)"
else
  warn "not inside a git repository"
fi

if command -v claude >/dev/null 2>&1; then
  claude mcp list 2>/dev/null | grep -qi linear && ok "Linear MCP configured" || warn "Linear MCP not configured (see setup guide)"
fi

if [ $QUICK -eq 0 ]; then
  if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then ok "Docker reachable"; else warn "Docker not reachable (start Docker Desktop; enable WSL integration)"; fi
  free_gb=$(df -BG --output=avail . 2>/dev/null | tail -1 | tr -dc '0-9')
  [ "${free_gb:-0}" -ge 10 ] && ok "disk free ${free_gb}GB" || warn "low disk space (${free_gb:-?}GB free)"
fi
exit 0
