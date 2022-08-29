#!/usr/bin/env bash
set -euo pipefail

echo "backing up to tmp/input.sol.bak"
cp tmp/input.sol tmp/input.sol.bak
delta -in_place -test=reduce_test_case_multidelta.sh -suffix=.sol tmp/input.sol

echo "✔︎ Finished running inital Delta reducing pass"