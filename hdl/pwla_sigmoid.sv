`timescale 1ns / 1ps

module pwla_sigmoid (input reg [15:0]x, output logic [15:0]f_x);

	reg [15:0]x_int;
	reg [15:0]result;
	
	always @ (*) begin
	
		x_int = x * 1024;
		// implementação da equação por partes
		// nesse momento considerar que o x de entrada é sempre positivo
		if (x_int >= 5120) begin
			result = 1024;
		end else if (x_int >= 2432 && x_int < 5120) begin
			result = (x_int + 864) >> 5;
		end else if (x_int >= 1024 && x_int < 2432) begin
			result = (x_int + 640) >> 3;
		end else if (x_int >= 0 && x_int < 1024) begin
			result = (x_int + 512) >> 2;
		end else begin
			result = 0;
		end
		
	end // always
	
	always @ (*) begin
		// check if input is negative
		if (x[15] == 1) begin
			f_x = 1-result;
		end else begin
			f_x = result;
		end
	end

endmodule