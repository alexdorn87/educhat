#!/bin/bash
set -x
set -euvo pipefail
IFS=$'\n\t'

CURL_URL="https://Eduard_Chat/releases/update"

curl -X POST "$CURL_URL"
