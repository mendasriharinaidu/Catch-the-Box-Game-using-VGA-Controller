module basket(clk,right,left,h_count,v_count,basket_x,basket_y,basket_on);

parameter BW=80;
parameter BH=10;
parameter SW=639;
parameter SH=469;
parameter N=500000;

input clk;
input right,left;
input [9:0] h_count,v_count;
reg clk1=0;
output reg [9:0]basket_x=250;
output [9:0]basket_y;
output basket_on;

reg [31:0]count;
always@(posedge clk)
if(count<N-1)
count<=count+1;
else if(count==N-1)
begin
count<=0;
clk1<=~clk1;
end
else
count<=0;

assign basket_y=SH;

always@(posedge clk1)
if(basket_x>0 && left)
basket_x<=basket_x-1;


else if(basket_x==0 && left)
basket_x<= SW-BW;

else if(basket_x+BW<SW && right)
basket_x<=basket_x+1;

else if(basket_x+BW==SW && right)
basket_x<=0;


assign basket_on=(h_count>=basket_x && h_count<=basket_x+BW) && (v_count>=basket_y && v_count<=basket_y+BH) ? 1:0;


endmodule
