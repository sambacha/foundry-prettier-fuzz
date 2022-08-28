#!/usr/bin/env bash
set -euo pipefail

echo "✔︎ Running MultiDelta..."
multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.sol
multidelta -level=10 ./reduce_test_case_multidelta.sh tmp/input.sol
sleep 1

echo "✔︎ Completed running MultiDelta..."