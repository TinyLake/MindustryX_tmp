#!/usr/bin/env bash

cd work/ || exit 1
rm ../patches/*
git format-patch --zero-commit -N -o ../patches base --
cd ../ && git add patches/