#!/bin/sh

set -e

cd "$(dirname "$0")/.."

KEY_FILE=asphalt/api-key.env

mkdir -p asphalt/assets

if [ ! -f "$KEY_FILE" ]; then
	cat > "$KEY_FILE" <<'TEMPLATE'
# Open Cloud API key with asset:read and asset:write: https://create.roblox.com/dashboard/credentials
ASPHALT_API_KEY=
TEMPLATE
	echo "Created $KEY_FILE. Fill in ASPHALT_API_KEY and run again." >&2
	exit 1
fi

set -a
. "./$KEY_FILE"
set +a

if [ -z "$ASPHALT_API_KEY" ]; then
	echo "ASPHALT_API_KEY is empty in $KEY_FILE." >&2
	exit 1
fi

asphalt sync "$@"
