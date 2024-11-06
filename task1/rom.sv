module rom #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    input logic clk,
    input logic [A_WIDTH-1:0] addr,
    output logic [D_WIDTH-1:0] dout
);
    logic [D_WIDTH-1:0] memory [(2**A_WIDTH)-1:0];

    //to display to Vbuddy
    initial begin
        $display("ROM is Loading...");
        $readmemh("sinerom.mem", memory);
    end;

    always_ff @(posedge clk) begin
        dout <= memory[addr];
    end
endmodule
