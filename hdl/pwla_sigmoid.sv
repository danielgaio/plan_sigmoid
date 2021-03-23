// arquivo contendo a descricao sitetizavel

`timescale 1ns / 1ps

module pwla_sigmoid (
	input 	logic [15:0] x,
	input 	logic clk,
	output 	logic [15:0] f_x
);
	
	// considerar a entrada ja como inteiro
	always @ (posedge clk) begin

		// implementacao da equacao por partes
		if (x >= 5120) begin

			f_x <= 1024;

		end else if (x >= 2432 && x < 5120) begin

			f_x <= ((x >> 5) + 864);

		end else if (x >= 1024 && x < 2432) begin

			f_x <= ((x >> 3) + 640);

		end else if (x >= 0 && x < 1024) begin

			f_x <= ((x >> 2) + 512);

		end else begin

			f_x <= 'bx;
			
		end

	end // always

endmodule