onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rxd_clk_opt

do {wave.do}

view wave
view structure
view signals

do {rxd_clk.udo}

run -all

quit -force
