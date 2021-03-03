 `timescale 1ns/1ps

module pwla_sigmoid_tb();

	// data types: inputs as registers and outputs as wires

	// inputs
	reg [15:0]x_tb;
	// outputs
	wire [15:0]f_x_tb;

	// test module
	pwla_sigmoid pwla_sigmoid_DUT(
		.x(x_tb),
		.f_x(f_x_tb)
	);

	// stimulus
	initial begin
		// colocar uns valores na entrada do módulo pra checar a saída
		x_tb = 2;
		$display("f_x = %f", f_x_tb);
	
	end

endmodule