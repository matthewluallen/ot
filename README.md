

# OT-sim + OpenPLC + Modbus REPL (Codespaces-ready)

This repo launches a GitHub Codespace that auto-installs and starts:
- **OpenPLC** (web UI on port 8080)
- **Modbus demo server** (port 5020)
- **pymodbus REPL console** (CLI tool)
- **noVNC desktop + Wireshark GUI** (port 6080)
- (Optional) **OT-sim** — edit `scripts/run-ot-sim.sh` to run specific modules

## Quick start
1. Click **Code → Create codespace on main**.
2. Wait for provisioning (first boot builds and installs).
3. Check services:
   ```bash
   supervisorctl -c /workspaces/ot/scripts/supervisord.conf status
