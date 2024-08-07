#!/bin/sh

set -o errexit
set -o nounset

TMP="$(mktemp -d)"
clean() { rm -rf "$TMP"; }
trap clean EXIT

cat << 'EOF' > "$TMP/schema.json"
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "allOf": [ { "$ref": "https://json.schemastore.org/mocharc.json" } ]
}
EOF

"$1" bundle "$TMP/schema.json" --http > "$TMP/result.json"

cat << 'EOF' > "$TMP/expected.json"
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "allOf": [
    {
      "$ref": "https://json.schemastore.org/mocharc.json"
    }
  ],
  "definitions": {
    "https://json.schemastore.org/mocharc.json": {
      "$schema": "http://json-schema.org/draft-07/schema#",
      "$id": "https://json.schemastore.org/mocharc.json",
      "title": "Mocha JS Configuration File Schema",
      "description": "A JSON schema describing a .mocharc.[json|yml|yaml] file",
      "type": "object",
      "properties": {
        "allow-uncaught": {
          "$ref": "#/definitions/bool"
        },
        "async-only": {
          "$ref": "#/definitions/bool"
        },
        "bail": {
          "$ref": "#/definitions/bool"
        },
        "check-leaks": {
          "$ref": "#/definitions/bool"
        },
        "color": {
          "$ref": "#/definitions/bool"
        },
        "config": {
          "$ref": "#/definitions/string"
        },
        "delay": {
          "$ref": "#/definitions/bool"
        },
        "diff": {
          "$ref": "#/definitions/bool"
        },
        "enable-source-maps": {
          "$ref": "#/definitions/bool"
        },
        "exit": {
          "$ref": "#/definitions/bool"
        },
        "extension": {
          "$ref": "#/definitions/string-array"
        },
        "fgrep": {
          "$ref": "#/definitions/string"
        },
        "file": {
          "$ref": "#/definitions/string-array"
        },
        "forbid-only": {
          "$ref": "#/definitions/bool"
        },
        "forbid-pending": {
          "$ref": "#/definitions/bool"
        },
        "full-trace": {
          "$ref": "#/definitions/bool"
        },
        "global": {
          "$ref": "#/definitions/string-array"
        },
        "grep": {
          "$ref": "#/definitions/string"
        },
        "growl": {
          "$ref": "#/definitions/bool"
        },
        "ignore": {
          "$ref": "#/definitions/string-array"
        },
        "inline-diffs": {
          "$ref": "#/definitions/bool"
        },
        "invert": {
          "$ref": "#/definitions/bool"
        },
        "jobs": {
          "$ref": "#/definitions/int"
        },
        "package": {
          "$ref": "#/definitions/string"
        },
        "parallel": {
          "$ref": "#/definitions/bool"
        },
        "recursive": {
          "$ref": "#/definitions/bool"
        },
        "reporter": {
          "$ref": "#/definitions/string"
        },
        "reporter-option": {
          "$ref": "#/definitions/string-array"
        },
        "require": {
          "$ref": "#/definitions/string-array"
        },
        "retries": {
          "$ref": "#/definitions/int"
        },
        "slow": {
          "$ref": "#/definitions/int"
        },
        "sort": {
          "$ref": "#/definitions/bool"
        },
        "spec": {
          "$ref": "#/definitions/string-array"
        },
        "timeout": {
          "$ref": "#/definitions/int"
        },
        "ui": {
          "$ref": "#/definitions/string"
        },
        "watch": {
          "$ref": "#/definitions/bool"
        },
        "watch-files": {
          "$ref": "#/definitions/string-array"
        },
        "watch-ignore": {
          "$ref": "#/definitions/string-array"
        }
      },
      "additionalProperties": true,
      "definitions": {
        "bool": {
          "type": "boolean"
        },
        "int": {
          "type": "integer",
          "minimum": 0
        },
        "string": {
          "type": "string"
        },
        "string-array": {
          "anyOf": [
            {
              "type": "string"
            },
            {
              "type": "array",
              "items": {
                "type": "string"
              }
            }
          ]
        }
      }
    }
  }
}
EOF

cat "$TMP/result.json"

diff "$TMP/result.json" "$TMP/expected.json"
