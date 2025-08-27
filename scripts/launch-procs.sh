#!/usr/bin/env bash
set -euxo pipefail
if pgrep -x supervisord >/dev/null; then
  echo "supervisord already running"
else
  supervisord -c /workspaces/ot/scripts/supervisord.conf >/tmp/supervisord.boot.log 2>&1 &
fi
