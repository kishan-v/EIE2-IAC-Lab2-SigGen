module sigdelay #(
    parameter A_WIDTH = 9,
    D_WIDTH = 8
) (
    input logic clk,
    input logic rst,
    input logic  wr, // write enable
    input logic  rd, // read enable
    input    logic   [A_WIDTH-1:0] offset, // offset value
    input    logic   [D_WIDTH-1:0] mic_signal,
    output    logic   [D_WIDTH-1:0] delayed_signal
);

  logic [A_WIDTH-1:0] wr_addr;

  dual_ram ram (
      .wr_addr(wr_addr),
      .din(mic_signal),
      .wr_en(wr),
      .clk(clk),
      .rd_en(rd),
      .dout(delayed_signal),
      .rd_addr({wr_addr - offset})
  );

  counter addrCounter (
      .rst  (rst),
      .clk  (clk),
      .count(wr_addr)
  );
endmodule
