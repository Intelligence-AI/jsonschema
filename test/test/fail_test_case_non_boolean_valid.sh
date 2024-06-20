#!/bin/sh

set -o errexit
set -o nounset

TMP="$(mktemp -d)"
clean() { rm -rf "$TMP"; }
trap clean EXIT

cat << 'EOF' > "$TMP/test.json"
{
  "schema": "http://json-schema.org/draft-04/schema#",
  "tests": [
    {
      "data": {},
      "valid": 1
    },
    {
      "valid": true,
      "data": {}
    }
  ]
}
EOF

"$1" test "$TMP/test.json" 1> "$TMP/output.txt" 2>&1 \
  && CODE="$?" || CODE="$?"
test "$CODE" = "1" || exit 1

cat << EOF > "$TMP/expected.txt"
$(realpath "$TMP")/test.json:
error: The test case document \`valid\` property must be a boolean
  at test case #1

Learn more here: https://github.com/Intelligence-AI/jsonschema/blob/main/docs/test.markdown
EOF

diff "$TMP/output.txt" "$TMP/expected.txt"
