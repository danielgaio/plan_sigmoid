`timescale 1ns / 1ps

module pwla_sigmoid (
	input logic [15:0]x,
	input logic clk,
	input logic reset,
	output logic [15:0]f_x);

	//logic [15:0] x_int;
	logic [15:0] x_mod;
	//logic [15:0] x_mod_plus;
	logic [15:0] x_register;
	logic [15:0] result;
	
	always @ (posedge clk) begin

		if (reset) begin
			// criar registrador aqui
			x_register <= x;

		end else begin

			// multiplicar entrada já registrada
			//x_int <= x_register << 10; // * 1024
			x_register <= x_register << 10;

			// fazer complemento
			if (x_register[15] == 1) begin
				// inverter bits de x
				//x_mod <= ~x_int;
				x_mod <= ~x_register;
				// somar 1
				//x_mod_plus <= x_mod + 1;
				x_mod <= x_mod + 1;
			end else begin
				//x_mod <= 16'b1111111111111111;
				//x_mod_plus <= x_int;
				x_mod <= x_register;
			end

			// implementação da equação por partes
			// --------------------------------------------------------------
			if (x_mod >= 5120) begin
				result <= 1024;
			end else if (x_mod >= 2432 && x_mod < 5120) begin
				result <= (x_mod + 864) << 5;
			end else if (x_mod >= 1024 && x_mod < 2432) begin
				result <= (x_mod + 640) << 3;
			end else if (x_mod >= 0 && x_mod < 1024) begin
				result <= (x_mod + 512) << 2;
			end else begin
				result <= 0;
			end
			// --------------------------------------------------------------

			// --------------------------------------------------------------
//			if (x_mod_plus >= 5) begin
//				result <= 1;
//			end else if (x_mod_plus >= 2.375 && x_mod_plus < 5) begin
//				result <= (x_mod_plus + 0.84375) * 0.03125;
//			end else if (x_mod_plus >= 1 && x_mod_plus < 2.375) begin
//				result <= (x_mod_plus + 0.625) * 0.625;
//			end else if (x_mod_plus >= 0 && x_mod_plus < 1) begin
//				result <= (x_mod_plus + 0.5) * 0.25;
//			end else begin
//				result <= 0;
//			end
			// --------------------------------------------------------------

			// check if input is negative
			if (x_register[15] == 1) begin
				f_x <= (1-result) >> 10;
			end else begin
				f_x <= result >> 10;
			end
		end // reset
		
	end // always

endmodule