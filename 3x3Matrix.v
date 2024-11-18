module 3x3Matrix();

	input wire clk;
	output reg [2:0] col_select;
	output reg [2:0] row_select;
	
	reg [2:0] current_row = 3'b000;
	reg [2:0] current_col  = 3'b000;
	
	always @(postedge clk) beign
		current_row <= current_row + 1;
		current_col <= current_col + 1;
		
		row_select <= current_row;
		col_select <= current_col;
	end
	
endmodule
			