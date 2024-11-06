module rom #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic clk,
    input logic [A_WIDTH-1:0] addr1,
    input logic [A_WIDTH-1:0] addr2,
    output logic [D_WIDTH-1:0] dout1,
    output logic [D_WIDTH-1:0] dout2
);
    logic [D_WIDTH-1:0] memory [(2**A_WIDTH)-1:0];

    //to display to Vbuddy
    initial begin
        $display("ROM is Loading...");
        $readmemh("sinerom.mem", memory);
    end;

    always_ff @(posedge clk) begin
        dout1 <= memory[addr1];
        dout2 <= memory[addr2];
    end
endmodule
