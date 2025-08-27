#!/usr/bin/env bash
set -euxo pipefail
ROOT="/workspaces"
OPENPLC_DIR="$ROOT/OpenPLC_v3"
if [ ! -d "$OPENPLC_DIR" ]; then
  git clone https://github.com/thiagoralves/OpenPLC_v3.git "$OPENPLC_DIR"
fi
cd "$OPENPLC_DIR"
sudo ./install.sh linux
echo "OpenPLC installed."
