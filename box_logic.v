module box(clk,h_count,v_count,box_x,box_x1,box_y,box_y1,box_on,box_on1 );
parameter BW=10;
parameter BH=10;
parameter SW=639;
parameter SH=479;
parameter N=500000;
parameter start=200;

input clk;
input [9:0] h_count,v_count;
reg clk1;
output reg [8:0] box_x=start;

output reg [8:0] box_x1=300;
output reg [9:0] box_y=0;

output reg [9:0] box_y1=240;
output box_on,box_on1;

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

always@(posedge clk1)
if(box_y<SH)
box_y<=box_y+1;
else if(box_y==SH)
begin
box_y<=0;
begin
if(box_x>0 && box_x+BW<SW)
box_x<={(box_x[0]^box_x[1]),box_x[8:1]};
else
box_x<=start;
end
end

always@(posedge clk1)
if(box_y1<479)
box_y1<=box_y1+1;
else if(box_y1==479)
begin
box_y1<=0;
box_x1<={(box_x1[0]^box_x1[1]),box_x1[8:1]};
end

assign box_on=(h_count>=box_x && h_count<=box_x+BW) && (v_count<=box_y && v_count>=box_y-BH) ? 1:0;

assign box_on1=(h_count>=box_x1 && h_count<=box_x1+BW) && (v_count<=box_y1 && v_count>=box_y1-BH) ? 1:0;


endmodule
