module slowCLK(    
	 input wire clk_50MHz,      
    input wire reset,        
    output reg clk       
);

    reg [26:0] counter;  

    localparam COUNT_LIMIT = 25000000; //.5 Hz refresh rate

    always @(posedge clk_50MHz or posedge reset) begin
        if (reset) begin
            counter <= 27'b0;  
            clk <= 0;    
        end else begin
            if (counter == COUNT_LIMIT - 1) begin
                counter <= 27'b0;    
                clk <= ~clk; 
            end else begin
                counter <= counter + 1; 
            end
        end
    end

endmodule
