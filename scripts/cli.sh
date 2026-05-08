#!/bin/bash
START=$(perl -MTime::HiRes=time -e 'printf "%.0f", time * 1000')
if command -v bun >/dev/null 2>&1; then
  bun packages/cli/src/index.ts "$@"
else
  node packages/cli/bin.js "$@"
fi
EXIT=$?
END=$(perl -MTime::HiRes=time -e 'printf "%.0f", time * 1000')
echo -e "\n⏱  Done in $((END - START))ms"
exit $EXIT
