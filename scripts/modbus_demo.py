from pymodbus.server import StartTcpServer
from pymodbus.datastore import ModbusSlaveContext, ModbusServerContext, ModbusSequentialDataBlock

# In-memory datastore (100 points)
store = ModbusSlaveContext(
    di=ModbusSequentialDataBlock(0, [0]*100),
    co=ModbusSequentialDataBlock(0, [0]*100),
    hr=ModbusSequentialDataBlock(0, [0]*100),
    ir=ModbusSequentialDataBlock(0, [0]*100),
    zero_mode=True,
)
context = ModbusServerContext(slaves=store, single=True)

if __name__ == "__main__":
    # IMPORTANT: keyword-only args for newer pymodbus signatures
    StartTcpServer(context=context, address=("0.0.0.0", 5020))
