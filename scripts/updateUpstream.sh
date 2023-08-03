#!/usr/bin/env bash

function getRef() {
    git ls-tree "$1" "$2" | cut -d' ' -f3 | cut -f1
}

cd base || exit 1
git fetch origin "$1" || (echo fail fetch && exit 1)
git tag -f base FETCH_HEAD && git reset --hard base || exit 1
refRemote=$(git rev-parse HEAD)
cd ../
git add --force base
refHEAD=$(getRef HEAD base)
echo "$refHEAD -> $refRemote"

if [ "$refHEAD" != "$refRemote" ]; then
  echo "Rebuilding patches"
  ./scripts/applyPatches.sh || exit 1
  ./scripts/genPatches.sh || exit 1
else
  echo "No update, revert to work"
  git reset --hard work
fi