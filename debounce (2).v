`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:29 05/05/2022 
// Design Name: 
// Module Name:    debounce 
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
 
module debounce(input btn, input clk,output d_button);
wire out1;
wire out2;
wire out3;
dflipflop d1(.clk(clk),.D(btn),.Q(out1));
dflipflop d2(.clk(clk),.D(out1),.Q(out2));
dflipflop d3(.clk(clk),.D(out2),.Q(out3));

assign d_button= out2 & ~out3; 
endmodule




module dflipflop(input clk,input D,output reg Q);
	always @(posedge clk)begin
		Q<=D;
	end
endmodule 
