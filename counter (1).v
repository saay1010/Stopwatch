`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:03 05/05/2022 
// Design Name: 
// Module Name:    counter 
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
module counter(input rst,input [1:0] state,input oneclock,input twoclock, output reg [5:0]mins,output reg[5:0]secs);
reg currclk;
always @(*)begin
	if(state==2'b00|state==2'b11)
		currclk=oneclock;
	else
		currclk=twoclock;
end
		
	
		
always @(posedge currclk or posedge rst) begin
   if(rst)begin
		mins<=0;
		secs<=0;
	end
   else if(state==2'b11)begin
            secs<=secs;
            mins<=mins;
            end
   else if (state==2'b01)begin
			if(mins==6'b111011)begin
					mins<=6'b000000;
					secs<=secs;
			end
			else begin
					mins<=mins+1;
					secs<=secs;
			end
	end
	else if(state==2'b10)begin
				if(secs==6'b111011) begin
					secs<=0;
					mins<=mins;
					end
				else begin
					secs<=secs+1;
					mins<=mins;
					end
	end
	else if(state==2'b00) begin 
		if(secs==6'b111011 && mins==6'b111011)begin
			secs<=6'b00000;
			mins<=6'b00000;
		end
		else if(secs == 6'b111011)begin
			secs<=0;
			mins<=mins+1;
			end         
		else begin
			secs<=secs+1;
			mins<=mins;
		end
	end
end
endmodule
