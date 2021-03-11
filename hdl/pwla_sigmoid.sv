`timescale 1ns / 1ps

module pwla_sigmoid (
	input 	logic [15:0] x,
	input 	logic clk,
	//input 	logic reset,
	output 	logic [15:0] f_x);

	logic [15:0] x_mod;
	//logic [15:0] x_register;
	logic [15:0] result;
	
	always @ (posedge clk) begin
		//if (reset) begin
			//f_x <= 0;
		//end else begin
			f_x <= result;
		//end // reset
	end // always
	
	// considerar a entrada ja como inteiro
	always @ (*) begin
		// fazer complemento
			if (x[15] == 1) begin
				// inverter bits de x, somar 1
				x_mod <= (~x) + 1;
			end else begin
				x_mod <= x;
			end
			// implementação da equação por partes & check if input is negative at the same time
			// --------------------------------------------------------------
			if (x_mod >= 5120) begin
				if (x[15] == 1) begin // negativo
					result <= (1 - 1024);
				end else begin
					result <= 1024;
				end
			end else if (x_mod >= 2432 && x_mod < 5120) begin
				if (x[15] == 1) begin // negativo
					result <= 1 - ((x_mod << 5) + 864);
				end else begin
					result <= ((x_mod << 5) + 864);
				end
			end else if (x_mod >= 1024 && x_mod < 2432) begin
				if (x[15] == 1) begin // negativo
					result <= 1 - ((x_mod << 3) + 640);
				end else begin
					result <= ((x_mod << 3) + 640);
				end
			end else if (x_mod >= 0 && x_mod < 1024) begin
				if (x[15] == 1) begin // negativo
					result <= 1 - ((x_mod << 2) + 512);
				end else begin
					result <= ((x_mod << 2) + 512);
				end
			end else begin
				result <= 0;
			end
			// --------------------------------------------------------------
	end // always

endmodule