#!/usr/bin/env zsh
set -euo pipefail

docker run --rm -it -p 8000:8000 -v ${PWD}:/site squidfunk/mkdocs-material