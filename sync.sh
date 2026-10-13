
#!/usr/bin/env bash
set -Eeuo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
NAVI_CHEATS="$HOME/.local/share/navi/cheats"
NAVI_CONFIG="$HOME/.config/navi/config.yaml"

cd "$PROJECT_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERROR: Initialize the repository first with git init."
    exit 1
fi

if [[ ! -d "$NAVI_CHEATS" ]]; then
    echo "ERROR: Navi cheats directory not found: $NAVI_CHEATS"
    exit 1
fi

echo "=== Syncing Navi files ==="

# Main personal cheatsheet
if [[ -f "$NAVI_CHEATS/main.cheat" ]]; then
    mkdir -p cheats
    cp -p "$NAVI_CHEATS/main.cheat" cheats/main.cheat
fi

# Your personal cheatsheets
if [[ -d "$NAVI_CHEATS/waseems_custom" ]]; then
    mkdir -p cheats/waseems_custom
    cp -a "$NAVI_CHEATS/waseems_custom/." cheats/waseems_custom/
fi

# Local Navi configuration, if present
if [[ -f "$NAVI_CONFIG" ]]; then
    cp -p "$NAVI_CONFIG" config.yaml
    echo "Copied Navi configuration."
else
    echo "No local config.yaml exists; skipping it."
fi

echo
echo "=== Files collected ==="
find cheats -type f -print 2>/dev/null || true

echo
echo "=== Review changes ==="
git status --short

read -r -p "Stage repository changes? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || exit 0

git add -A
git diff --cached
git diff --cached --stat

read -r -p "Commit these changes? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || exit 0

if git diff --cached --quiet; then
    echo "Nothing to commit."
    exit 0
fi

read -r -p "Commit message [Update Navi cheatsheets]: " message
git commit -m "${message:-Update Navi cheatsheets}"

echo "Done. Push manually when ready using git push."
