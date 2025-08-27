#!/usr/bin/env bash
set -euxo pipefail
exec python3 -m pymodbusrepl.server --host 0.0.0.0 --port 5020
