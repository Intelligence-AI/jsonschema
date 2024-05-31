#!/bin/sh

set -o errexit
set -o nounset

TMP="$(mktemp -d)"
# shellcheck disable=SC2317
clean() { rm -rf "$TMP"; }
trap clean EXIT

cat << 'EOF' > "$TMP/schema.json"
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "string"
}
EOF

"$1" lint "$TMP/schema.json"
