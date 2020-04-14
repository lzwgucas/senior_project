`timescale 1ns / 1ps


module remainder(clk,enable,dividend,divisor,result,valid);

	input clk;
	input enable;
	input [31:0] dividend,divisor;
	output [31:0] result;
	output valid;
	
	reg [63:0] dividend_copy,divisor_copy,diff;
	
	wire [31:0] remainder = dividend_copy [31:0];
	reg continue = 0;
	reg [5:0]  bits;
	
	reg valid=0;
	
	initial bits = 33;
	
	always@(posedge clk)
	begin
	 if (enable) begin
		if(bits==33)
			begin
				bits = 32;
				dividend_copy = {32'd0,dividend};
				divisor_copy = {1'd0,divisor,31'd0};
			end
		else
			begin
			    valid = (bits==1) && enable;
				diff = dividend_copy - divisor_copy;
				if( !diff[63] )
					begin
						dividend_copy = diff;
					end
	
				divisor_copy = divisor_copy >> 1;
				bits = (bits==0) ? 33 :  bits - 1; //muhtemelen burası sorunlu
                
			end
	   end

	 end
	
	assign result = remainder;
	endmodule