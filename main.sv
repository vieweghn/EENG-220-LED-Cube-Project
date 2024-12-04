module main(
    input MAX10_CLK1_50,
    input KEY0,KEY1,
    output reg IO0, IO1, IO2, IO3, IO4, IO5, IO6, IO7, IO8, IO9,
    output reg IO10, IO11, IO12, IO13, IO14, IO15, IO16, IO17, IO18, IO19
);

    wire clk_120Hz, clk0_5Hz;
    wire [9:0] x, y;  // 10-bit signals for each column and row
	 reg [3:0] patternIndex;
	 wire [9:0] pattern [9:0];
	 wire button1, button0;
	 
	 initial begin 
			patternIndex = 4'b0000;
	 end
	 
	 // button debouncer for KEY1
	 button_debouncer bd1 (
			.clk(MAX10_CLK1_50), 
			.rst_n(1'b1), 
			.data_in(KEY1), 
			.data_out(button1)
	 );
	 
	 // button debouncer for KEY0
	 button_debouncer bd0 (
			.clk(MAX10_CLK1_50), 
			.rst_n(1'b1), 
			.data_in(KEY0), 
			.data_out(button0)
			);

    // Generate 120Hz clock from 50MHz clock
    _120Hz clk120 (
        .clk_50MHz(MAX10_CLK1_50),
        .reset(~button0),  // Reset when KEY0 is pressed
        .clk_120Hz(clk_120Hz)
    );
     
    // Generate 0.5Hz clock from 50MHz clock
    slowCLK clk0_5 (
        .clk_50MHz(MAX10_CLK1_50),
        .reset(~button0),  // Reset when KEY0 is pressed
        .clk(clk0_5Hz)
    );
	 
// Pattern Controller FSM
    patternController patternFSM (
        .clk(clk_120Hz),   
        .rst(~button0),    
        .btn(button1),     
        .patternIndex(4'b0),
        .patternRow(pattern) 
    );

    // Screen refresh logic
    screenRefresh sr (
        .clk(clk_120Hz),  // Use the 120Hz clock here
        .rst(~button0),  // Reset on KEY0 press
        .row(pattern), // Pass the predefined pattern array
        .x(x), .y(y)
    );
	 
	 always @(posedge clk0_5Hz or posedge ~button0) begin
			if (~button0) begin
					patternIndex = 4'b0000;
			end
			else begin
					patternIndex <= (patternIndex + 1) % 6;
			end
	 end

    // Assign the x and y values to IO pins to control the LED matrix
    always @(posedge clk_120Hz) begin
        IO0 <= ~x[9];
        IO1 <= ~x[8];
        IO2 <= ~x[7];
        IO3 <= ~x[6];
        IO4 <= ~x[5];
        IO5 <= ~x[4];
        IO6 <= ~x[3];
        IO7 <= ~x[2];
        IO8 <= ~x[1];
        IO9 <= ~x[0];
        IO10 <= y[9];  // Invert y to control active high for rows
        IO11 <= y[8];
        IO12 <= y[7];
        IO13 <= y[6];
        IO14 <= y[5];
        IO15 <= y[4];
        IO16 <= y[3];
        IO17 <= y[2];
        IO18 <= y[1];
        IO19 <= y[0];
    end
endmodule
