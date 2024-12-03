module _120Hz(
    input wire clk_50MHz,      
    input wire reset,        
    output reg clk_120Hz       
);

    reg [15:0] counter;  

    localparam COUNT_LIMIT = 50000; //1000 Hz refresh rate

    always @(posedge clk_50MHz or posedge reset) begin
        if (reset) begin
            counter <= 16'b0;  
            clk_120Hz <= 0;    
        end else begin
            if (counter == COUNT_LIMIT - 1) begin
                counter <= 16'b0;    
                clk_120Hz <= ~clk_120Hz; 
            end else begin
                counter <= counter + 1; 
            end
        end
    end

endmodule
