`default_nettype none

module matrix_mult (
    input wire [7:0]    mat1,
    input wire [3:0]    mat2,
    input wire          clk,
    input wire          reset_n,
    output reg [9:0]   mat_out
);
    always @(posedge clk) begin
        if (!reset_n) begin
            mat_out <= 10'b0000000000;
        end else begin
            mat_out[4:0] <= (mat1[1:0] * mat2[1:0]) + (mat1[3:2] * mat2[3:2]);
            mat_out[9:5] <= (mat1[5:4] * mat2[1:0]) + (mat1[7:6] * mat2[3:2]);
        end
    end

endmodule
