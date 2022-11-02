module counter #(
    parameter WIDTH = 9
) (
    // interface signals
    input  logic             clk,   // clock
    input  logic             rst,   // reset
    //input  logic             en,    // counter enable
    output logic [WIDTH-1:0] count
);

  always_ff @(posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else count <= count + {{WIDTH - 1{1'b0}}, 1'b1};
endmodule

