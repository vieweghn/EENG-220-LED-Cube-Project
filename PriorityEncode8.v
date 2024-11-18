module PriorityEncode8 (
    input  [7:0] in,
    output reg [2:0] code,
    output reg z
);

always @(*) begin
    // Default values
    code = 3'b000; // Default output when all inputs are 0
    z = 1;        // Assume z=1 until we find a high input

    // Priority encoding
    if (in[7]) begin
        code = 3'b111; // Highest priority
        z = 0;
    end else if (in[6]) begin
        code = 3'b110;
        z = 0;
    end else if (in[5]) begin
        code = 3'b101;
        z = 0;
    end else if (in[4]) begin
        code = 3'b100;
        z = 0;
    end else if (in[3]) begin
        code = 3'b011;
        z = 0;
    end else if (in[2]) begin
        code = 3'b010;
        z = 0;
    end else if (in[1]) begin
        code = 3'b001;
        z = 0;
    end else if (in[0]) begin
        code = 3'b000; // All inputs are 0
        z = 0;
    end
end

endmodule
