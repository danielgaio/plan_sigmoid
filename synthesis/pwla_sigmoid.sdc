# Create virtual clocks 

create_clock -period 10.5 -name clk clk

# Set input and output delay

set_input_delay -clock [get_clocks clk] -max 5 [all_inputs]

set_output_delay -clock [get_clocks clk] -max 5 [all_outputs]