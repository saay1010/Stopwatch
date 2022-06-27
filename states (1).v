`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:12 05/05/2022 
// Design Name: 
// Module Name:    states 
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
module states(input sel,input clk,input pause, input res,input adj,output reg[1:0] next_state);
    reg paused1;
	 always @(posedge clk or posedge res)begin
      if(res)
        next_state<=2'b00;
		else if(pause==1'b1 && adj==1'b0)
			next_state<=2'b11;
		else if(pause==1'b0 && adj==1'b0)
			next_state<=2'b00;
		else if(next_state==2'b11 && adj==1'b0) 
			next_state<=next_state;
		else if(next_state==2'b00 && adj==1'b0) 
			next_state<=next_state;
      else if(adj==1'b0)
			next_state<=2'b00;
		else if(adj==1'b1 && sel ==1'b0)
			next_state<=2'b01;
		else
			next_state<=2'b10;
    end
endmodule
