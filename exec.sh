#!/usr/bin/env bash
shopt -s globstar
set -euo pipefail

args=("$@")
if [ "${#args[@]}" -lt 2 ]; then args+=(fixtures/*.sol); fi
if [ "${#args[@]}" -lt 2 ]; then args+=(fixtures/**/*.sol); fi

exec $CMD_BINARY -$FLAG --$OUTPUT_DIR "${args[@]}"