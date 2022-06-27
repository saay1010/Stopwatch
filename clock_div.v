`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:16 05/05/2022 
// Design Name: 
// Module Name:    clock_div 
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
module clock_div(input clk,input rst,output reg one_clock,output reg two_clock, output reg deb_clock,output reg blink_clock);
reg [25:0] ctr2 = 0;
parameter dv2 = 50000000;
reg [26:0] ctr1 = 0;
parameter dv1 = 100000000;
reg [25:0] ctrdeb = 0;
parameter dvdeb = 400000;
reg [25:0] ctrblink = 0;
parameter blink= 25000000;
always @(posedge clk or posedge rst)begin
	if(rst)begin
		ctr1<=0;
		one_clock<=0;
		end
	else if(ctr1==dv1-1)begin
		ctr1<=0;
        one_clock<=1;
        end
	else begin
		ctr1<=ctr1+1;
		one_clock<=0;
		end
end
always @(posedge clk or posedge rst)begin
	if(rst)begin
		ctr2<=0;
		two_clock<=0;
		end
	else if(ctr2==dv2-1)begin
		ctr2<=0;
        two_clock<=1;
        end
	else begin
		ctr2<=ctr2+1'b1;
		two_clock<=0;
		end
end
always @(posedge clk or posedge rst)begin
	if(rst)begin
		ctrdeb<=0;
		deb_clock<=0;
		end
	else if(ctrdeb==dvdeb-1)begin
		ctrdeb<=0;
        deb_clock<=1;
        end
	else begin
		ctrdeb<=ctrdeb+1'b1;
		deb_clock<=0;
		end
end
always @(posedge clk or posedge rst)begin
	if(rst)begin
		ctrblink<=0;
		blink_clock<=0;
		end
	else if(ctrblink==blink-1)begin
		 ctrblink<=0;
       blink_clock<=~blink_clock;
        end
	else begin
		ctrblink<=ctrblink+1'b1;
		blink_clock<=blink_clock;
		end
end
endmodule
