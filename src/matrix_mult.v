`default_nettype none

module matrix_mult (
    input wire [7:0]    mat1,
    input wire [7:0]    mat2,
    input wire          clk,
    input wire          reset_n
    output reg [9:0]   mat_out
);
    always @posedge(clk) begin
        if (!reset_n) begin
            mat_out <= 16b'0000000000000000;
        end else begin
            if ( (mat1[0:1] > 2b'11) | (mat1[2:3] > 2b'11) | (mat1[4:5] > 2b'11) | 
            (mat1[6:7] > 2b'11) | (mat2[0:1] > 2b'11) | (mat2[2:3] > 2b'11) ) begin
                mat_out <= 16b'0000000000000000;
            end else begin
                mat_out[0:4] <= (mat1[0:1] * mat2[0:1]) + (mat1[2:3] * mat2[2:3]);
                mat_out[5:9] <= (mat1[4:5] * mat2[0:1]) + (mat1[6:7] * mat2[2:3]);
            end
        end
    end

endmodule
