module screenRefresh(
    input clk,
    input rst,
    input [9:0] row [9:0],  // Array input for row patterns
    output reg [9:0] x,
    output reg [9:0] y
);

    localparam [3:0] Init = 0,
                          row0 = 1, 
                          row1 = 2, 
                          row2 = 3, 
                          row3 = 4, 
                          row4 = 5, 
                          row5 = 6, 
                          row6 = 7, 
                          row7 = 8, 
                          row8 = 9, 
                          row9 = 10;
    
    reg [3:0] State;  // Use 4-bit state register to accommodate all states
    
    always @(posedge clk) begin
        if (rst) begin
            State <= Init;
        end else begin 
            case (State)
                Init: State <= row0;
                row0: State <= row1;
                row1: State <= row2;
                row2: State <= row3;
                row3: State <= row4;
                row4: State <= row5;
                row5: State <= row6;
                row6: State <= row7;
                row7: State <= row8;
                row8: State <= row9;
                row9: State <= row0;
                default: State <= Init;
            endcase
        end

        case (State)
            Init: begin 
                x = 0;
                y = 0;
            end
            
            row0: begin
                x = row[0];
                y = 10'b1000000000;
            end
            
            row1: begin
                x = row[1];
                y = 10'b0100000000;
            end
            
            row2: begin
                x = row[2];
                y = 10'b0010000000;
            end
            
            row3: begin
                x = row[3];
                y = 10'b0001000000;
            end
                
            row4: begin
                x = row[4];
                y = 10'b0000100000;
            end
            
            row5: begin
                x = row[5];
                y = 10'b0000010000;
            end
            
            row6: begin
                x = row[6];
                y = 10'b0000001000;
            end
            
            row7: begin
                x = row[7];
                y = 10'b0000000100;
            end
            
            row8: begin
                x = row[8];
                y = 10'b0000000010;
            end
            
            row9: begin
                x = row[9];
                y = 10'b0000000001;
            end
        endcase
    end
endmodule
