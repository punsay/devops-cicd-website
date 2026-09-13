#!/usr/bin/env bash
set -euo pipefail

echo "Running simple website checks..."

test -f index.html
test -f css/style.css
test -f js/app.js

grep -q "DevOps Training" index.html
grep -q "CI/CD Deployment Successful" index.html
grep -q "Version:" index.html

echo "Tests passed."
