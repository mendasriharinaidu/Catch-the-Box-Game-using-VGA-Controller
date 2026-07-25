module vga_controller(clk,h_sync,v_sync,right,left,red,blue,green,catch1,drop);

parameter box_width=10;
parameter basket_width=80;

input clk;
input right,left;
wire clk_25;
reg [9:0] h_count;
reg [9:0]v_count=0;
output h_sync,v_sync;
output [3:0] red,blue,green;
output catch1,drop;

wire [9:0] basket_x,basket_y;
wire [8:0] box_x,box_x1;
wire [9:0] box_y,box_y1;
wire basket_on,box_on,box_on1;
wire t_on,a_on,l_on1,l_on2,y_on;
wire w_on,i_on,n_on;
wire [5:0] score;
wire game_over;
wire zero,five,one,two,three,four,five1;

reg [2:0]count=0;
always@(posedge clk)
if(count<4)
count<=count+1;
else if(count==4)
count<=0;

assign clk_25=(count==0||count==1)?0:1;

always@(posedge clk_25)
if(h_count<799)
h_count<=h_count+1;
else if(h_count==799)
begin
h_count<=0;
begin
if(v_count==524)
v_count<=0;
else
v_count<=v_count+1;
end
end
else
h_count<=0;

assign h_sync=(h_count>=655 && h_count<=751)?0:1;
assign v_sync=(v_count>=489 && v_count<=491)?0:1;

basket a(clk,right,left,h_count,v_count,basket_x,basket_y,basket_on );
box b(clk,h_count,v_count,box_x,box_x1,box_y,box_y1,box_on,box_on1 );

assign catch1=(box_y==basket_y)&&(box_x>=basket_x && box_x+box_width<=basket_x+basket_width)||(box_y1==basket_y)&&(box_x1>=basket_x && box_x1+box_width<=basket_x+basket_width) ?1:0;
assign drop=(box_y==basket_y) && !(box_x>=basket_x && box_x+box_width<=basket_x+basket_width)||(box_y1==basket_y) && !(box_x1>=basket_x && box_x1+box_width<=basket_x+basket_width)?1:0;

assign t_on=((h_count>520 && h_count<=535) && (v_count>10 && v_count<=12) || (h_count>526 && h_count<=528) && (v_count>12 && v_count<=26))?1:0;
assign a_on=((h_count>540 && h_count<=542) && (v_count>10 && v_count<=26) || (h_count>542 && h_count<=553) && (v_count>10 && v_count<=12) || (h_count>542 && h_count<=553) && (v_count>17 && v_count<=19) || (h_count>553 && h_count<=555) && (v_count>10 && v_count<=26))?1:0;
assign l_on1=((h_count>560 && h_count<=562) && (v_count>10 && v_count<=24) || (h_count>560 && h_count<=575) && (v_count>24 && v_count<=26))?1:0;
assign l_on2=((h_count>580 && h_count<=582) && (v_count>10 && v_count<=24) || (h_count>580 && h_count<=595) && (v_count>24 && v_count<=26))?1:0;
assign y_on= ((h_count>600 && h_count<=602) && (v_count>10 && v_count<=16) || (h_count>600 && h_count<=613) && (v_count>16 && v_count<=18) || (h_count>613 && h_count<=615) && (v_count>10 && v_count<=26) || (h_count>600 && h_count<=613) && (v_count>24 && v_count<=26))?1:0;


assign w_on=(((h_count>=80 && h_count<=100) && (v_count>=100 && v_count<=360) || (h_count>=166 && h_count<=186) && (v_count>=180 && v_count<=360) || (h_count>=252 && h_count<=272) && (v_count>=100 && v_count<=360) || (h_count>=80 && h_count<=272) && (v_count>=360 && v_count<=380)) && (score==50))?1:0;
assign i_on=(((h_count>=310 && h_count<=330) && (v_count>=100 && v_count<=380)) && (score==50))?1:0;
assign n_on=(((h_count>=368 && h_count<=388) && (v_count>=100 && v_count<=380) || (h_count>=388 && h_count<=454) && (v_count>=100 && v_count<=120) || (h_count>=454 && h_count<=474) && (v_count>=100 && v_count<=380) || (h_count>=474 && h_count<=540) && (v_count>=360 && v_count<=380) || (h_count>=540 && h_count<=560) && (v_count>=100 && v_count<=380)) && (score==50))?1:0;


reg [7:0]catch_point=0;
reg [7:0]drop_point=0;

always@(posedge catch1)
if(score<50)
catch_point<=catch_point+5;

always@(posedge drop)
if(score>0 && score<50)
drop_point<=drop_point+5;

assign score=catch_point-drop_point;

assign game_over=(score==50)?1:0;

assign zero= (((h_count>575 && h_count<=605) && (v_count>40 && v_count<=44) || (h_count>575 && h_count<=579) && (v_count>44 && v_count<=76) || (h_count>601 && h_count<=605) && (v_count>44 && v_count<=76) || (h_count>575 && h_count<=605) && (v_count>76 && v_count<=80)) && (score==0 || score==10 || score==20 || score==30 || score==40 || score==50))?1:0;
assign five= (((h_count>575 && h_count<=605) && (v_count>40 && v_count<=44) || (h_count>575 && h_count<=579) && (v_count>40 && v_count<=58) || (h_count>575 && h_count<=605) && (v_count>58 && v_count<=62) || (h_count>601 && h_count<=605) && (v_count>62 && v_count<=76) || (h_count>575 && h_count<=605) && (v_count>76 && v_count<=80)) && (score==5 || score==15 || score==25 || score==35 || score==45))?1:0;
assign one= (((h_count>540 && h_count<=544) && (v_count>40 && v_count<=80)) && (score==10 || score==15))?1:0;
assign two= (((h_count>540 && h_count<=570) && (v_count>40 && v_count<=44) || (h_count>566 && h_count<=570) && (v_count>44 && v_count<=58) || (h_count>540 && h_count<=570) && (v_count>58 && v_count<=62) || (h_count>540 && h_count<=544) && (v_count>62 && v_count<=76) || (h_count>540 && h_count<=570) && (v_count>76 && v_count<=80)) && (score==20 || score==25))?1:0;
assign three= (((h_count>540 && h_count<=566) && (v_count>40 && v_count<=44) || (h_count>540 && h_count<=566) && (v_count>58 && v_count<=62) || (h_count>540 && h_count<=566) && (v_count>76 && v_count<=80) || (h_count>566 && h_count<=570) && (v_count>40 && v_count<=80)) && (score==30 || score==35))?1:0;
assign four= (((h_count>540 && h_count<=544) && (v_count>40 && v_count<=58) || (h_count>540 && h_count<=566) && (v_count>58 && v_count<=62) || (h_count>566 && h_count<=570) && (v_count>40 && v_count<=80)) && (score==40 || score==45))?1:0;
assign five1= (((h_count>540 && h_count<=570) && (v_count>40 && v_count<=44) || (h_count>540 && h_count<=544) && (v_count>44 && v_count<=58) || (h_count>540 && h_count<=570) && (v_count>58 && v_count<=62) || (h_count>566 && h_count<=570) && (v_count>62 && v_count<=76) || (h_count>540 && h_count<=570) && (v_count>76 && v_count<=80)) && (score==50))?1:0;


assign red =(box_on||box_on1||t_on||a_on||l_on1||l_on2||y_on)?4'b1111:4'b0000;
assign green =(basket_on||box_on||t_on||a_on||l_on1||l_on2||y_on||zero||five||one||two||three||four||five1||w_on||i_on||n_on)? 4'b1111:4'b0000;
assign blue =(zero||five||one||two||three||four||five1)?4'b1111:4'b0000;

ila_0 score_card (
	.clk(clk), // input wire clk
	.probe0(catch1), // input wire [0:0]  probe0  
	.probe1(drop), // input wire [0:0]  probe1 
	.probe2(score), // input wire [5:0]  probe2 
	.probe3(game_over) // input wire [0:0]  probe3
);


endmodule
