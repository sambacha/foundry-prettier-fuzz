git diff --diff-filter=d --cached | grep '^[+-]' | grep -Ev '^(--- a/|\+\+\+ b/)' | forge fmt
