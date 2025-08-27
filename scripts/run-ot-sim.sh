#!/usr/bin/env bash
set -euxo pipefail
cd /workspaces/ot/ot-sim
if [ -x "./ot-sim" ]; then
  exec ./ot-sim
else
  echo "OT-sim placeholder. Edit scripts/run-ot-sim.sh to run your desired module."
  exec sleep infinity
fi
