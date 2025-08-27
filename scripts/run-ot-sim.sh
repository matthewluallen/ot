#!/usr/bin/env bash
set -euxo pipefail
cd /workspaces/ot-sim
if [ -f "./ot-sim" ]; then
  exec ./ot-sim
else
  echo "OT-sim placeholder running."
  exec sleep infinity
fi
