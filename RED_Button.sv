//red Button
module button_control(
    input wire clk,           
    input wire rst_n,         
    input wire button,        
    output reg system_on  
);

    wire debounced_button;
    reg toggle_state;

    // Debounce the button input
    button_debouncer debounce_inst (
        .clk(clk),
        .rst_n(rst_n),
        .button(button),
        .debounced(debounced_button)
    );

   
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            toggle_state <= 1'b0; // System off
        else if (debounced_button)
            toggle_state <= ~toggle_state; 
    end

  
    assign system_on = toggle_state;

endmodule
