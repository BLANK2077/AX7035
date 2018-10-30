onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk_200M_opt

do {wave.do}

view wave
view structure
view signals

do {clk_200M.udo}

run -all

quit -force
