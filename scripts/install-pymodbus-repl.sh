#!/usr/bin/env bash
set -euxo pipefail
cd /workspaces/ot

# Ensure venv exists
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# Install/upgrade required packages
./.venv/bin/pip install --upgrade pip

# Install pymodbus with the REPL extra, pinned to a stable version
./.venv/bin/pip install "pymodbus[repl]==3.5.4"

# Quick sanity check
./.venv/bin/python - <<'PY'
import pymodbus
print("pymodbus:", pymodbus.__version__)
PY
