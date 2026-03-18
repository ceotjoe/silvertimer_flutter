#!/usr/bin/env bash
# =============================================================================
# bump_version.sh — Bump the version in pubspec.yaml and commit the change.
#
# Usage:
#   ./scripts/bump_version.sh patch          # 1.0.0+1  →  1.0.1+2
#   ./scripts/bump_version.sh minor          # 1.0.0+1  →  1.1.0+2
#   ./scripts/bump_version.sh major          # 1.0.0+1  →  2.0.0+2
#   ./scripts/bump_version.sh 1.2.3          # 1.0.0+1  →  1.2.3+2
#
# What this script does:
#   1. Reads the current version from pubspec.yaml
#   2. Calculates the new semver + increments the build number
#   3. Updates pubspec.yaml in-place
#   4. Pauses so you can update CHANGELOG.md in the same commit
#   5. Commits pubspec.yaml + CHANGELOG.md with a conventional commit message
#
# What this script does NOT do:
#   - Push to remote (do that yourself, then open a PR from dev → main)
#   - Create a git tag (the deploy workflow does that automatically on main)
#
# Requirements: bash ≥ 3.2, macOS or Linux, git in $PATH
# =============================================================================
set -euo pipefail

# ── Locate files ─────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PUBSPEC="$REPO_ROOT/pubspec.yaml"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"

# ── Helpers ───────────────────────────────────────────────────────────────────
usage() {
  echo "Usage: $(basename "$0") patch|minor|major|X.Y.Z" >&2
  exit 1
}

read_version() {
  grep -E '^version: ' "$PUBSPEC" | sed 's/version: //'
}

# ── Argument validation ───────────────────────────────────────────────────────
[[ $# -ne 1 ]] && usage

BUMP="$1"
if [[ ! "$BUMP" =~ ^(patch|minor|major|[0-9]+\.[0-9]+\.[0-9]+)$ ]]; then
  echo "Error: unrecognised argument '$BUMP'" >&2
  usage
fi

# ── Read and parse current version ───────────────────────────────────────────
RAW="$(read_version)"
if [[ -z "$RAW" ]]; then
  echo "Error: could not find 'version:' line in $PUBSPEC" >&2
  exit 1
fi

# Split "X.Y.Z+N" → semver and build number
SEMVER="${RAW%%+*}"
BUILD="${RAW##*+}"
IFS='.' read -r MAJOR MINOR PATCH <<< "$SEMVER"

echo "Current version : $SEMVER  (build $BUILD)"

# ── Calculate new version ─────────────────────────────────────────────────────
case "$BUMP" in
  patch)
    NEW_SEMVER="$MAJOR.$MINOR.$((PATCH + 1))"
    ;;
  minor)
    NEW_SEMVER="$MAJOR.$((MINOR + 1)).0"
    ;;
  major)
    NEW_SEMVER="$((MAJOR + 1)).0.0"
    ;;
  *)
    # Explicit X.Y.Z — validate it differs from current
    NEW_SEMVER="$BUMP"
    if [[ "$NEW_SEMVER" == "$SEMVER" ]]; then
      echo "Error: new version '$NEW_SEMVER' is identical to current version '$SEMVER'" >&2
      exit 1
    fi
    ;;
esac

# Build number is always monotonically increasing — never reset, even on major bumps.
NEW_BUILD="$((BUILD + 1))"
NEW_VERSION="$NEW_SEMVER+$NEW_BUILD"

echo "New version     : $NEW_SEMVER  (build $NEW_BUILD)"
echo ""

# ── Update pubspec.yaml ───────────────────────────────────────────────────────
# macOS sed requires the empty-string argument after -i.
# The '^version: ' anchor prevents matching dependency version lines.
sed -i '' "s/^version: .*/version: $NEW_VERSION/" "$PUBSPEC"

# Verify the change landed correctly
VERIFIED="$(read_version)"
if [[ "$VERIFIED" != "$NEW_VERSION" ]]; then
  echo "Error: sed replacement failed. pubspec.yaml contains: '$VERIFIED'" >&2
  exit 1
fi

echo "✓ pubspec.yaml updated to version: $NEW_VERSION"

# ── CHANGELOG reminder ────────────────────────────────────────────────────────
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ACTION REQUIRED before committing:"
echo ""
echo "  Open CHANGELOG.md and move the items under '## [Unreleased]'"
echo "  into a new dated section:"
echo ""
echo "  ## [$NEW_SEMVER] - $(date +%Y-%m-%d)"
echo ""
echo "  Also add a comparison link at the bottom of CHANGELOG.md:"
echo "  [$NEW_SEMVER]: https://github.com/ceotjoe/silvertimer_flutter/compare/v$SEMVER...v$NEW_SEMVER"
echo "  Update [Unreleased] to: .../compare/v$NEW_SEMVER...HEAD"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -rp "Press Enter when CHANGELOG.md is ready (Ctrl-C to abort)..."

# ── Commit ────────────────────────────────────────────────────────────────────
cd "$REPO_ROOT"
git add pubspec.yaml CHANGELOG.md
git commit -m "chore: bump version to $NEW_VERSION"

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "✓ Committed: chore: bump version to $NEW_VERSION"
echo ""
echo "Next steps:"
echo "  1.  git push origin dev"
echo "  2.  Open a PR: dev → main  (title: 'chore: release v$NEW_SEMVER')"
echo "  3.  After merge, the deploy workflow will build, deploy, and"
echo "      automatically create the annotated tag v$NEW_SEMVER on main."
