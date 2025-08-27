#!/usr/bin/env bash
set -euo pipefail

export DISPLAY=:1
VNC_PASS="${VNC_PASS:-vscode}"
VNC_GEOM="${VNC_GEOM:-1280x800}"
VNC_DEPTH="${VNC_DEPTH:-24}"
NOVNC_WEB="/usr/share/novnc"
LOG="/tmp/novnc.start.log"

echo "=== start-novnc $(date) ===" > "$LOG"

command -v vncserver >>"$LOG" 2>&1 || { echo "vncserver not found" >>"$LOG"; exit 127; }
command -v websockify >>"$LOG" 2>&1 || { echo "websockify not found" >>"$LOG"; exit 127; }

mkdir -p "$HOME/.vnc"
printf "%s\n%s\n\n" "$VNC_PASS" "$VNC_PASS" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

cat > "$HOME/.vnc/xstartup" <<'EOS'
#!/usr/bin/env bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XKL_XMODMAP_DISABLE=1
xrdb $HOME/.Xresources
startxfce4
EOS
chmod +x "$HOME/.vnc/xstartup"

vncserver -kill :1 >>"$LOG" 2>&1 || true
vncserver :1 -geometry "$VNC_GEOM" -depth "$VNC_DEPTH" -SecurityTypes VncAuth >>"$LOG" 2>&1

for i in {1..30}; do
  ss -lnt | grep -q ':5901' && { echo "VNC 5901 listening" >>"$LOG"; break; }
  sleep 0.3
done
ss -lnt | grep -q ':5901' || { echo "ERROR: VNC (5901) failed" >>"$LOG"; tail -n 100 "$HOME/.vnc/"*":1.log" >>"$LOG" 2>&1 || true; exit 1; }

exec websockify --web="$NOVNC_WEB" 6080 localhost:5901 >>"$LOG" 2>&1
