onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pwm_tb/inst/clk
add wave -noupdate /pwm_tb/inst/rst
add wave -noupdate /pwm_tb/inst/new_cycle
add wave -noupdate -radix unsigned /pwm_tb/inst/duty
add wave -noupdate /pwm_tb/inst/pwm
add wave -noupdate -radix unsigned /pwm_tb/inst/counter
add wave -noupdate -radix unsigned /pwm_tb/inst/half_cycle
add wave -noupdate -radix unsigned /pwm_tb/inst/half_cycle_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
run 1000 ns
WaveRestoreZoom {0 ps} {1 us}

