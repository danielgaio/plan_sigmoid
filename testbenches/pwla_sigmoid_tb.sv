// potencialmente tem que acrescentar Bus antes dos sinais ao longo do código 
 
`timescale 1ns/1ps

module pwla_sigmoid_tb();

	logic [15:0] x_tb, f_x_tb;
	logic clk_tb;
	//logic reset_tb;

	shortreal generated_results [65536:0];
	logic j;
	shortreal i;

	// test module
	pwla_sigmoid pwla_sigmoid_DUT(
		.x(x_tb),
		.clk(clk_tb),
		//.reset(reset_tb),
		.f_x(f_x_tb)
	);

	// bloco gerador de clock
	initial clk_tb = 0;
	always #5 clk_tb = ~clk_tb;

	// stimulus
	initial begin
		fork
			// inicializar registrador de entrada
			x_tb = -4.5 * 1024;
			//reset_tb = 1;
			
			#30
			//reset_tb = 0;
			//#60
			$display("f_x = %f", f_x_tb);
		join
		$stop;

		// sessão para geração exaustiva de valores de entrada
		fork
			j = 0;
			for (i=-5; i<=5; i++) begin
				// x tem que receber valores entre -5 e 5
				x_tb = i;
				$display("x = %d", x_tb);
				#20
				generated_results [j] = f_x_tb;
				$display("f_x = %d", f_x_tb);

				j++;
			end
		join
		$stop;


	end

endmodule