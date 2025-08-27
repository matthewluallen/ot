import time, math
from pymodbus.client import ModbusTcpClient

HOST = "127.0.0.1"
PORT = 5020
UNIT = 1  # Modbus slave/unit id

def main():
    c = ModbusTcpClient(HOST, port=PORT)
    if not c.connect():
        print(f"Could not connect to Modbus server at {HOST}:{PORT}")
        return 1
    t0 = time.time()
    try:
        while True:
            t = time.time() - t0
            # two changing signals
            value0 = int((math.sin(t) * 50) + 50)       # ~0..100
            value1 = int((math.cos(t/2) * 500) + 500)   # ~0..1000
            c.write_register(0, value0, unit=UNIT)      # HR0
            c.write_register(1, value1, unit=UNIT)      # HR1
            time.sleep(1.0)
    finally:
        c.close()

if __name__ == "__main__":
    raise SystemExit(main())
