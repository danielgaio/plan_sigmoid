`timescale 1ns / 1ps

module pwla_sigmoid (
	input 	logic [15:0] x,
	input 	logic clk,
	//input 	logic reset,
	output 	logic [15:0] f_x
);
	
	// sinais internos
	//logic [15:0] result;
	
	// registrando a saida
//	always @ (posedge clk) begin
//		f_x <= result;
//	end
	
	// considerar a entrada ja como inteiro
	always @ (posedge clk) begin
		// implementação da equação por partes
		// --------------------------------------------------------------
		if (x >= 5120) begin
			//result <= 1024;
			f_x <= 1024;
		end else if (x >= 2432 && x < 5120) begin
			//result <= ((x >> 5) + 864);
			f_x <= ((x >> 5) + 864);
		end else if (x >= 1024 && x < 2432) begin
			//result <= ((x >> 3) + 640);
			f_x <= ((x >> 3) + 640);
		end else if (x >= 0 && x < 1024) begin
			//result <= ((x >> 2) + 512);
			f_x <= ((x >> 2) + 512);
		end else begin
			//result <= 'bx;
			f_x <= 'bx;
		end
		// --------------------------------------------------------------
	end // always

endmodule