#!/usr/bin/env bash
set -euxo pipefail

# VNC password (change if you like)
VNC_PASS="${VNC_PASS:-vscode}"

# Prepare VNC auth
mkdir -p "$HOME/.vnc"
echo "$VNC_PASS" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

# Start a minimal XFCE session when VNC starts
cat > "$HOME/.vnc/xstartup" <<'EOS'
#!/usr/bin/env bash
xrdb $HOME/.Xresources
startxfce4 &
EOS
chmod +x "$HOME/.vnc/xstartup"

# Start VNC server on display :1 (TCP 5901)
export DISPLAY=:1
tightvncserver :1 -geometry 1280x800 -depth 24

# Start noVNC on TCP 6080 -> proxies to VNC :5901
exec websockify --web=/usr/share/novnc/ 6080 localhost:5901
