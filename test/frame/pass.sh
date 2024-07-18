#!/bin/sh

set -o errexit
set -o nounset

TMP="$(mktemp -d)"
clean() { rm -rf "$TMP"; }
trap clean EXIT

cat << 'EOF' > "$TMP/schema.json"
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com",
  "$ref": "#/$defs/string",
  "$defs": {
    "string": { "type": "string" }
  }
}
EOF

"$1" frame "$TMP/schema.json" > "$TMP/result.txt"

cat << 'EOF' > "$TMP/expected.txt"
(LOCATION) URI: https://example.com
    Root             : https://example.com
    Pointer          :
    Base             : https://example.com
    Relative Pointer :
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$defs
    Root             : https://example.com
    Pointer          : /$defs
    Base             : https://example.com
    Relative Pointer : /$defs
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$defs/string
    Root             : https://example.com
    Pointer          : /$defs/string
    Base             : https://example.com
    Relative Pointer : /$defs/string
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$defs/string/type
    Root             : https://example.com
    Pointer          : /$defs/string/type
    Base             : https://example.com
    Relative Pointer : /$defs/string/type
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$id
    Root             : https://example.com
    Pointer          : /$id
    Base             : https://example.com
    Relative Pointer : /$id
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$ref
    Root             : https://example.com
    Pointer          : /$ref
    Base             : https://example.com
    Relative Pointer : /$ref
    Dialect          : https://json-schema.org/draft/2020-12/schema
(LOCATION) URI: https://example.com#/$schema
    Root             : https://example.com
    Pointer          : /$schema
    Base             : https://example.com
    Relative Pointer : /$schema
    Dialect          : https://json-schema.org/draft/2020-12/schema
(REFERENCE) URI: /$ref
    Type             : Static
    Destination      : https://example.com#/$defs/string
    - (w/o fragment) : https://example.com
    - (fragment)     : /$defs/string
(REFERENCE) URI: /$schema
    Type             : Static
    Destination      : https://json-schema.org/draft/2020-12/schema
    - (w/o fragment) : https://json-schema.org/draft/2020-12/schema
EOF

diff "$TMP/result.txt" "$TMP/expected.txt"