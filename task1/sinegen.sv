module sinegen #(
    parameter A_WIDTH = 8,  // address width
    D_WIDTH = 8  // data width
) (
    input logic clk,
    input logic rst,
    input logic  en,
    input    logic   [D_WIDTH-1:0] incr, // counter increment value
    output    logic   [D_WIDTH-1:0] dout
);

  logic [A_WIDTH-1:0] address;  // interconnect wire 

  counter addrCounter (
      .rst(rst),
      .en(en),
      .clk(clk),
      .incr(incr),
      .count(address)
  );
  rom sinRom (
      .clk (clk),
      .addr(address),
      .dout(dout)
  );

endmodule
