#!/usr/bin/env bash
set -euxo pipefail
if ! pgrep -x supervisord >/dev/null; then
  supervisord -c /workspaces/scripts/supervisord.conf &
fi
