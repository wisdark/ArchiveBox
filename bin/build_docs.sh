#!/usr/bin/env bash

### Bash Environment Setup
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# set -o xtrace
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
IFS=$'\n'

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

source "$REPO_DIR/.venv/bin/activate"
cd "$REPO_DIR"



echo "[*] Fetching latest docs version"
cd "$REPO_DIR/docs"
git pull
cd "$REPO_DIR"

echo "[+] Building docs"
sphinx-apidoc -o docs archivebox
cd "$REPO_DIR/docs"
make html
# open docs/_build/html/index.html to see the output
cd "$REPO_DIR"
