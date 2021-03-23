// essa interface não esta sendo utilizada no projeto

// pinos externos
interface intf;
	
	logic [15:0]x;
	logic clk;
	logic reset;
	logic [15:0]f_x;

	modport DUT (input x,clk,reset, output f_x);
	modport TEST (output x,clk,reset, input f_x);

endinterface