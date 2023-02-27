###################################################################

# Created by write_sdc on Mon Feb 27 12:14:35 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_area 0
set_driving_cell -lib_cell INVX1 -library osu05_stdcells [get_ports {a[1]}]
set_driving_cell -lib_cell INVX1 -library osu05_stdcells [get_ports {a[0]}]
set_driving_cell -lib_cell INVX1 -library osu05_stdcells [get_ports {b[1]}]
set_driving_cell -lib_cell INVX1 -library osu05_stdcells [get_ports {b[0]}]
set_driving_cell -lib_cell INVX1 -library osu05_stdcells [get_ports cin]
set_fanout_load 8 [get_ports {s[1]}]
set_fanout_load 8 [get_ports {s[0]}]
set_fanout_load 8 [get_ports cout]
set_load -pin_load 0.1 [get_ports {s[1]}]
set_load -pin_load 0.1 [get_ports {s[0]}]
set_load -pin_load 0.1 [get_ports cout]
set_max_fanout 1 [get_ports {a[1]}]
set_max_fanout 1 [get_ports {a[0]}]
set_max_fanout 1 [get_ports {b[1]}]
set_max_fanout 1 [get_ports {b[0]}]
set_max_fanout 1 [get_ports cin]
create_clock -name clk  -period 40  -waveform {0 20}
set_clock_latency 0.3  [get_clocks clk]
set_input_delay -clock clk  2  [get_ports {a[1]}]
set_input_delay -clock clk  2  [get_ports {a[0]}]
set_input_delay -clock clk  2  [get_ports {b[1]}]
set_input_delay -clock clk  2  [get_ports {b[0]}]
set_input_delay -clock clk  2  [get_ports cin]
set_output_delay -clock clk  1.65  [get_ports {s[1]}]
set_output_delay -clock clk  1.65  [get_ports {s[0]}]
set_output_delay -clock clk  1.65  [get_ports cout]
