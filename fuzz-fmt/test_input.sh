#!/usr/bin/env bash
set gnu_errfmt


echo "Using Prettier...."

mkdir -p 'tmp'

yarn -s prettier --parser solidity $1 2>/dev/null > tmp/formatted.sol
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "✔︎ Processing..."
    exit
fi
yarn -s prettier --parser solidity tmp/formatted.sol 2>/dev/null > tmp/formatted_but_again.sol
SECOND_TRY=$?
if [ "$FIRST_TRY" -ne "$SECOND_TRY" ]; then
    echo "✘ ALERT: Different error codes: $FIRST_TRY against $SECOND_TRY"
    exit 1
fi
diff tmp/formatted.sol tmp/formatted_but_again.sol
if [ $? -eq 1 ]; then
    echo "✘ Analysis: Fuzzing difference found!"
    exit 127
fi
echo "✔︎ Passing check"
exit 0