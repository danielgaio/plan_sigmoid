`timescale 1ns / 1ps

module pwla_sigmoid (input [15:0]x, output [15:0]f_x);

	reg [15:0]x_int;

	initial begin
		x_int = x * 1024;
		$display(x_int);
	end

endmodule