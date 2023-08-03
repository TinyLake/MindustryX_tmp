#!/usr/bin/env bash

cd base || exit 1
rm ../patches/*
git format-patch -N -o ../patches base --
cd ../ && git add patches/