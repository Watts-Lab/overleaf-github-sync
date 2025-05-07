#!/bin/sh
set -e

# inputs come in as $1, $2, $3
COOKIE="$1"
PROJECT_ID="$2"
HOST="${3:-www.overleaf.com}"

ENDPOINT="https://${HOST}/project/${PROJECT_ID}/github-sync/merge"
echo "→ Triggering Overleaf sync via POST ${ENDPOINT}"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
  -X POST "$ENDPOINT" \
  -H "Cookie: overleaf_session2=${COOKIE}" \
  -H "Accept: application/json")

if [ "$HTTP_CODE" != "200" ]; then
  echo "::error::Overleaf sync failed (HTTP $HTTP_CODE)"
  exit 1
fi

echo "::notice::Overleaf sync triggered successfully"
