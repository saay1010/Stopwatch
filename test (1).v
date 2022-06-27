`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:03:53 02/09/2022 
// Design Name: 
// Module Name:    test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:03:53 02/09/2022 
// Design Name: 
// Module Name:    test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module display(
    input [3:0]in,
    output reg [7:0] cathodes);
	always @(*) begin
		case (in)            
            4'd0: cathodes = 8'b00000011;
            4'd1: cathodes = 8'b10011111;
            4'd2: cathodes = 8'b00100101;
            4'd3: cathodes = 8'b00001101;
            4'd4: cathodes = 8'b10011001;
            4'd5: cathodes = 8'b01001001;
            4'd6: cathodes = 8'b01000001;
            4'd7: cathodes = 8'b00011111;
            4'd8: cathodes = 8'b00000001;
            4'd9: cathodes = 8'b00001001;
			default: cathodes = 8'b11111111;
		endcase
	end
endmodule
