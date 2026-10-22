#!/usr/bin/env bash
# Regenerates all generated sources and fails if they differ from what is
# committed (stale codegen or a schema change without a regenerate).
set -euo pipefail
cd "$(dirname "$0")/.."

dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n

if ! git diff --exit-code --stat; then
  echo "Generated files are out of date. Run tool/check_generated.sh locally and commit the result." >&2
  exit 1
fi
if [ -n "$(git status --porcelain --untracked-files=all)" ]; then
  git status --porcelain --untracked-files=all
  echo "Generation produced untracked files. Commit them." >&2
  exit 1
fi
