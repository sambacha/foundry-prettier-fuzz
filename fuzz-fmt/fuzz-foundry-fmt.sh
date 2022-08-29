#!/usr/bin/env bash
shopt -s globstar

mkdir -p 'artifacts'
mkdir -p 'tmp'

trap "exit" SIGHUP SIGINT SIGTERM

# for i in {0..1000000}; do
for i in {0..1000}; do
    radamsa ../prettier-plugin-solidity/test/fixtures/*/**.sol > tmp/input.sol
    ./test_input.sh tmp/input.sol
    if [ $? -ne 0 ]; then
        CRASHFILENAME=artifacts/crash-`date +%s`.sol
        echo "✘ Copying failing output to $CRASHFILENAME"
        cp tmp/input.sol "$CRASHFILENAME"
        exit
    fi
done
sleep 1

echo "✔︎ Fuzzing Cycle Complete"