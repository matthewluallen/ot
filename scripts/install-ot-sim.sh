#!/usr/bin/env bash
set -euxo pipefail
ROOT="/workspaces/ot"
OT_SIM_DIR="$ROOT/ot-sim"

if [ ! -d "$OT_SIM_DIR" ]; then
  git clone https://github.com/patsec/ot-sim.git "$OT_SIM_DIR"
fi

cd "$OT_SIM_DIR"
if [ -f "Makefile" ]; then
  make -j"$(nproc)"
fi
echo "OT-sim fetched/built (adjust per module as needed)."
