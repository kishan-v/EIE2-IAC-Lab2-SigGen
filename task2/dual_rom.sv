module dual_rom #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input   logic   clk,
    input logic [ADDRESS_WIDTH-1:0] addr1,
    input logic [ADDRESS_WIDTH-1:0] addr2,
    output logic [DATA_WIDTH-1:0] dout1,
    output logic [DATA_WIDTH-1:0] dout2

);// End of port list

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0]; // how does this work?

initial begin
    $display("Loading rom.");
    $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk)
    // output is synchronous
    begin
    dout1 <= rom_array [addr1];
    dout2 <= rom_array [addr2];
    end
endmodule
