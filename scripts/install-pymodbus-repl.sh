#!/usr/bin/env bash
set -euxo pipefail
cd /workspaces/ot

# Create venv once
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# Install packages into venv
./.venv/bin/pip install --upgrade pip
./.venv/bin/pip install "pymodbus" "pymodbus_repl"

# Sanity check
./.venv/bin/python -c "import pymodbus, pymodbus_repl; print('OK:', pymodbus.__version__)"
