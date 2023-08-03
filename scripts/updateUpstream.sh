#!/usr/bin/env bash

function getRef() {
    git ls-tree "$1" "$2" | cut -d' ' -f3 | cut -f1
}

cd work/ || exit 1
git fetch origin "$1" && git clean -fd && git reset --hard FETCH_HEAD || exit 1
refRemote=$(git rev-parse HEAD)
cd ../
git add --force work
refHEAD=$(getRef HEAD work)
echo "$refHEAD -> $refRemote"

if [ "$refHEAD" != "$refRemote" ]; then
  echo "Rebuilding patches"
  ./scripts/applyPatches.sh || exit 1
  ./scripts/genPatches.sh || exit 1
else
  echo "No update, revert to work"
  git reset --hard work
fi