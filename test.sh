#!/bin/sh
set -e
expected="<title>WebSphere Liberty 17.0.0.4</title>"
actual=`curl localhost`
echo "Expecting: $expected"
echo "Server says: $actual"
if [[ "$expected" == *"$actual"* ]]; then
  echo "Test failed"
  exit 1
else
  echo "Test passed"
  exit 0
fi
