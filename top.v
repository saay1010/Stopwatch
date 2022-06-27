`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:58 05/05/2022 
// Design Name: 
// Module Name:    top 
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

module top(input clk,input sel,input adj,input pause,input res,output reg [7:0]cathode,output reg[3:0] anode);
	wire oneclock;
	wire twoclock;
	wire debclock;
	wire blinkclock;
	clock_div div1(.clk(clk),.rst(res),.one_clock(oneclock),.two_clock(twoclock),.deb_clock(debclock),.blink_clock(blinkclock));
	wire pause_deb;
	debounce deb1(.btn(pause),.clk(debclock),.d_button(pause_deb));
	wire [1:0] state1;
	states s1(.sel(sel),.clk(clk),.pause(pause),.res(res),.adj(adj),.next_state(state1));
	wire [5:0]mins;
	wire [5:0]secs;
	counter c1(.rst(res),.state(state1),.oneclock(oneclock),.twoclock(twoclock),.mins(mins),.secs(secs));
	wire [3:0]min1;
	wire [3:0]min0;
	wire [3:0]sec1;
	wire [3:0]sec0;
	reg [1:0]currdigit=2'b00;
	wire [7:0] dig3;
	wire [7:0] dig2;
	wire [7:0] dig1;
	wire [7:0] dig0;
	wire [7:0] blank=8'b11111111;
	assign min1=mins/10;
	assign min0=mins%10;
	assign sec1=secs/10;
	assign sec0=secs%10;
	display m1(.in(min1),.cathodes(dig3));
	display m0(.in(min0),.cathodes(dig2));
	display second1(.in(sec1),.cathodes(dig1));
	display second0(.in(sec0),.cathodes(dig0));
	always @(posedge debclock)begin
	if(state1==2'b01)begin
			if(currdigit==0)begin
				anode<=4'b0111;
				if(blinkclock)begin
					cathode<=blank;
				end
				else begin
					cathode<=dig3;
				end
				currdigit<=currdigit+1;
			end
			else if(currdigit==1)begin
				anode<=4'b1011;
				if(blinkclock)begin
					cathode<=blank;
				end
				else begin
					cathode<=dig2;
				end
				currdigit<=currdigit+1;
			end
			else if(currdigit==2)begin
				anode<=4'b1101;
				cathode<=dig1;
				currdigit<=currdigit+1;
			end
			else begin
				anode<=4'b1110;
				cathode<=dig0;
				currdigit<=currdigit+1;
			end
		end
		else if(state1==2'b10) begin
			if (currdigit==0) begin
				anode<=4'b0111;
				cathode<=dig3;
				currdigit<=currdigit+1;
			end
			else if(currdigit==1)begin
				anode<=4'b1011;
				cathode<=dig2;
				currdigit<=currdigit+1;
			end
			else if(currdigit==2)begin
				anode<=4'b1101;
				if(blinkclock)begin
					cathode<=blank;
				end
				else begin
					cathode<=dig1;
				end
				currdigit<=currdigit+1;
			end
			else if(currdigit==3)begin
				anode<=4'b1110;
				if(blinkclock) begin
					cathode<=blank;
				end
				else begin
					cathode<=dig0;
				end
				currdigit<=currdigit+1;
			end
		end
	else begin
	 if(currdigit==0)begin
			anode<=4'b0111;
			cathode<=dig3;
			currdigit<=currdigit+1;
			end
		else if(currdigit==1)begin
			anode<=4'b1011;
			cathode<=dig2;
			currdigit<=currdigit+1;
			end
		else if(currdigit==2)begin
			anode<=4'b1101;
			cathode<=dig1;
			currdigit<=currdigit+1;
			end
		else if(currdigit==3)begin
			anode<=4'b1110;
			cathode<=dig0;
			currdigit<=currdigit+1;
			end
		end
	end
	endmodule


