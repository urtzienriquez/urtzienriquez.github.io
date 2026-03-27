#!/bin/bash

FILE="$1"

if [ -z "$FILE" ]; then
    echo "Usage: $0 <rendered-md-file>"
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)

FULL_FILE_PATH=$(realpath "$FILE")

HUGO_PATH=$(echo "$FULL_FILE_PATH" | sed -E "s|.*${REPO_ROOT}/content/||; s|/[^/]+$|/|")

HUGO_PATH="/${HUGO_PATH}"

echo "Base Repo: $REPO_ROOT"
echo "Hugo URL Path: $HUGO_PATH"

sed -i -E "s|src=\"(\./)?index\.|src=\"${HUGO_PATH}index.|g" "$FILE"

echo "✓ Fixed image paths in: $FILE"
