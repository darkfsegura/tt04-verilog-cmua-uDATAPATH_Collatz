import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def test_BB_SYSTEM(dut):
    dut._log.info("START")
    clock = Clock(dut.BB_SYSTEM_CLOCK_50, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("TEST1")
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    dut.BB_SYSTEM_data_InBUS.value = 255
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 1
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
 
    dut._log.info("TEST2")
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    dut.BB_SYSTEM_data_InBUS.value = 254
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 1
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)

    dut._log.info("TEST3")
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    dut.BB_SYSTEM_data_InBUS.value = 127
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 1
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)
    dut.BB_SYSTEM_RESET_InHigh.value = 0
    await ClockCycles(dut.BB_SYSTEM_CLOCK_50, 10000)

