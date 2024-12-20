module patternStorage (
    input wire clk,
    input wire rst,
    input wire [3:0] patternIndex,  // 4-bit index to select patterns (16 patterns max)
    output reg [9:0] patternRow [9:0] // 10x10 LED patterns
);

    // Memory array to store multiple patterns
    reg [9:0] patterns [1:5][0:9];  // 5 patterns, each 10 rows of 10 columns

    // Initialize patterns (example patterns, can be customized)
    initial begin
        // Pattern 1
        patterns[1][0] = 10'b0110000110;
        patterns[1][1] = 10'b0110000110;
        patterns[1][2] = 10'b0110000110;
        patterns[1][3] = 10'b0110000110;
        patterns[1][4] = 10'b0110000110;
        patterns[1][5] = 10'b0110000110;
        patterns[1][6] = 10'b0110000110;
        patterns[1][7] = 10'b0110000110;
        patterns[1][8] = 10'b0011111100;
        patterns[1][9] = 10'b0001111000;
        
        // Pattern 2
        patterns[2][0] = 10'b0011111100;
        patterns[2][1] = 10'b0011111100;
        patterns[2][2] = 10'b0000110000;
        patterns[2][3] = 10'b0000110000;
        patterns[2][4] = 10'b0000110000;
        patterns[2][5] = 10'b0000110000;
        patterns[2][6] = 10'b0000110000;
        patterns[2][7] = 10'b0000110000;
        patterns[2][8] = 10'b0011111100;
        patterns[2][9] = 10'b0011111100;
        
        // Pattern 3
        patterns[3][0] = 10'b0011000011;
        patterns[3][1] = 10'b0011000011;
        patterns[3][2] = 10'b0011100011;
        patterns[3][3] = 10'b0011110011;
        patterns[3][4] = 10'b0011011011;
        patterns[3][5] = 10'b0011001111;
        patterns[3][6] = 10'b0011000111;
        patterns[3][7] = 10'b0011000011;
        patterns[3][8] = 10'b0011000011;
        patterns[3][9] = 10'b0011000011;
        
        // Pattern 4
        patterns[4][0] = 10'b0011111000;
        patterns[4][1] = 10'b0011111100;
        patterns[4][2] = 10'b0011000110;
        patterns[4][3] = 10'b0011000011;
        patterns[4][4] = 10'b0011000011;
        patterns[4][5] = 10'b0011000011;
        patterns[4][6] = 10'b0011000011;
        patterns[4][7] = 10'b0011000110;
        patterns[4][8] = 10'b0011111100;
        patterns[4][9] = 10'b0011110000;
        
        // Pattern 5
        patterns[5][0] = 10'b0011000011;
        patterns[5][1] = 10'b0011000011;
        patterns[5][2] = 10'b0001100110;
        patterns[5][3] = 10'b0000111100;
        patterns[5][4] = 10'b0000111100;
        patterns[5][5] = 10'b0000011000;
        patterns[5][6] = 10'b0000011000;
        patterns[5][7] = 10'b0000011000;
        patterns[5][8] = 10'b0000011000;
        patterns[5][9] = 10'b0000011000;
        
        // Additional patterns can be added here
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset output patterns
            patternRow[0] <= 10'b0;
            patternRow[1] <= 10'b0;
            patternRow[2] <= 10'b0;
            patternRow[3] <= 10'b0;
            patternRow[4] <= 10'b0;
            patternRow[5] <= 10'b0;
            patternRow[6] <= 10'b0;
            patternRow[7] <= 10'b0;
            patternRow[8] <= 10'b0;
            patternRow[9] <= 10'b0;
        end 
		  else begin
            // Retrieve selected pattern
            patternRow[0] <= patterns[patternIndex][0];
            patternRow[1] <= patterns[patternIndex][1];
            patternRow[2] <= patterns[patternIndex][2];
            patternRow[3] <= patterns[patternIndex][3];
            patternRow[4] <= patterns[patternIndex][4];
            patternRow[5] <= patterns[patternIndex][5];
            patternRow[6] <= patterns[patternIndex][6];
            patternRow[7] <= patterns[patternIndex][7];
            patternRow[8] <= patterns[patternIndex][8];
            patternRow[9] <= patterns[patternIndex][9];
        end
    end
endmodule
