`timescale 1ns / 1ps

module pwla_sigmoid (input [15:0]x, output [15:0]f_x);

	reg [15:0]x_int;

	initial begin
		x_int = x * 1024;
		$display(x_int);
		
		// implementação da equação por partes
		// nesse momento considerar que o x de entrada é sempre positivo
		if (x_int >= 5120) begin
			f_x = 1024;
		end else if (x_int >= 2432 & x_int < 5120) begin
			f_x = (x_int + 864) >> 5;
		end
	end

endmodule