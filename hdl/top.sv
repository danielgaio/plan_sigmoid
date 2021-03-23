// este arquivo nao esta esta sendo usado no projeto

module top;
  intf Bus();
  pwla_sigmoid_tb pwla_tb(Bus.TEST);
  pwla_sigmoid pwla_dut(Bus.DUT);
endmodule