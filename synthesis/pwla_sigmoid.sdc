# Especificacao do clock da arquitetura

create_clock -period 10.5 -name clk clk

# Configuracao de delay de entrada e saida

set_input_delay -clock [get_clocks clk] -max 5 [all_inputs]

set_output_delay -clock [get_clocks clk] -max 5 [all_outputs]