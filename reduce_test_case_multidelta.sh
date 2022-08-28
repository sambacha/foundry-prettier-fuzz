#!/usr/bin/env bash

# to minimize the test case using the output of `test_input.sh`
# Explore using Comby for reducing 

mkdir -p 'tmp'
TMP_DIR="$HOME/Github/fuzz-prettier-plugin-solidity/tmp"
PRETTIER="$HOME/Github/fuzz-prettier-plugin-solidity/node_modules/.bin/prettier"

"$PRETTIER" --parser solidity $TMP_DIR/input.sol 2>/dev/null > "$TMP_DIR/formatted.sol"
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit 1
fi
"$PRETTIER" --parser solidity "$TMP_DIR/formatted.sol" 2>/dev/null > "$TMP_DIR/formatted_but_again.sol"
SECOND_TRY=$?
diff "$TMP_DIR/formatted.sol" "$TMP_DIR/formatted_but_again.sol"
if [ $? -eq 1 ]; then
    echo "Difference found!"
    exit 0
fi
exit 1