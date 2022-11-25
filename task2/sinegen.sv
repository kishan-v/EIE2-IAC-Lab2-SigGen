module sinegen #(
    parameter A_WIDTH = 8,  // address width
    D_WIDTH = 8  // data width
) (
    input logic clk,
    input logic rst,
    input logic  en,
    input    logic   [D_WIdTH-1:0] ofst, // offset value
    output    logic   [D_WIDTH-1:0] dout1,
    output    logic   [D_WIDTH-1:0] dout2
);

  logic [A_WIDTH-1:0] address1;  // interconnect wire 

  counter addrCounter (
      .rst(rst),
      .en(en),
      .clk(clk),
      .count(address1)
  );
  dual_rom sinRom (
      .clk  (clk),
      .addr1(address1),
      .addr2(address1 + ofst),  // address2 === address1 + offset
      .dout1(dout1),
      .dout2(dout2)
  );

endmodule
