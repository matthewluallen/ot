#!/usr/bin/env bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

ROOT="/workspaces/ot"
OPENPLC_DIR="$ROOT/OpenPLC_v3"

if [ ! -d "$OPENPLC_DIR" ]; then
  git clone https://github.com/thiagoralves/OpenPLC_v3.git "$OPENPLC_DIR"
fi

cd "$OPENPLC_DIR"
sudo apt-get update -y
# Run non-interactively; ignore non-zero exit to avoid failing container creation
if ! sudo -E ./install.sh linux < /dev/null; then
  echo "OpenPLC installer returned non-zero; check /tmp/openplc.err.log after startup."
fi
