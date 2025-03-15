#!/usr/bin/env bash

docker build -t chezmoi-test -f tests/Dockerfile.ubuntu .
docker run chezmoi-test

