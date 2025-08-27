#!/usr/bin/env bash
set -euxo pipefail
exec /workspaces/ot/.venv/bin/python -m pymodbus_repl.server --host 0.0.0.0 --port 5020
