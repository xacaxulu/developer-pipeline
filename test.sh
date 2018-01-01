#!/bin/sh
set -e
echo "Running tests..."
echo ""
expected="<p>This is the home page for a sample application used to illustrate the"
actual=`curl -v localhost:9080/sample/`
echo "Expecting: $expected"
echo "Server says: $actual"
if [[ "$expected" == *"$actual"* ]]; then
  echo "Test failed"
  exit 1
else
  echo "Test passed"
  exit 0
fi
