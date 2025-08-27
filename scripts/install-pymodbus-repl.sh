#!/usr/bin/env bash
set -euxo pipefail
python3 -m pip install --upgrade pip
python3 -m pip install "pymodbus"
python3 -m pip install "git+https://github.com/pymodbus-dev/repl"
