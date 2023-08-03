#!/usr/bin/env bash

cd base || exit 1
git tag -f base
git am ../patches/*