#!/usr/bin/env bash

docker build -t chezmoi-test --progress plain -f tests/Dockerfile.ubuntu .
docker run chezmoi-test

