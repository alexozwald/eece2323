onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xorgate_opt

do {wave.do}

view wave
view structure
view signals

do {xorgate.udo}

run -all

quit -force
