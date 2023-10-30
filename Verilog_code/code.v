
module mainCounter(input clk,
    input reset, 
    input ld_morn,
    input [6:0] data_in_morn,
    input ld_mid,
    input [6:0] data_in_mid,
    input ld_night,
    input [6:0] data_in_night,
    output med_0,
    output med_1,
    output med_2,
    output med_3);

    wire [2:0] count;
    
    wire en_morn, en_mid, en_night, d00, d01, d02, d03, d10, d11, d12, d13, d20, d21, d22, d23;
    wire d001, d011, d021, d031, d102, d112, d122, d132, d203, d213, d223, d233;
    counter c1( clk, reset, count);

    comparator morn_comp(en_morn, count[0], data_in_morn[0], count[1], data_in_morn[1], count[2], data_in_morn[2]);
    comparator mid_comp(en_mid, count[0], data_in_mid[0], count[1], data_in_morn[1], count[2], data_in_morn[2]);
    comparator night_comp(en_night, count[0], data_in_night[0], count[1], data_in_night[1], count[2], data_in_night[2]);

    decoder d_morn1(d00, d01, d02, d03, en_morn, data_in_morn[3], data_in_morn[4]);
    decoder d_morn2(d001, d011, d021, d031, en_morn, data_in_morn[5], data_in_morn[6]);
    decoder d_mid1(d10, d11, d12, d13, en_mid, data_in_mid[3], data_in_mid[4]);
    decoder d_mid2(d102, d112, d122, d132, en_mid, data_in_mid[5], data_in_mid[6]);
    decoder d_night1(d20, d21, d22, d23, en_night, data_in_night[3], data_in_night[4]);
    decoder d_night2(d203, d213, d223, d233, en_night, data_in_night[5], data_in_night[6]);

    assign med_0 = d00 + d001 + d10 + d102 + d20 + d203;
    assign med_1 = d01 + d011 + d11 + d112 + d21 + d213;
    assign med_2 = d02 + d021 + d12 + d122 + d22 + d223;
    assign med_3 = d03 + d031 + d13 + d132 + d23 + d233;
    
endmodule



module decoder(d3, d2, d1, d0, en, x, y);
input en, x, y;
output d3, d2, d1, d0;

assign d1 = en&(~x)&(~y);
assign d2 = en&(~x)&(y);
assign d3 = en&(x)&(~y);
assign d4 = en&(x)&(y);

endmodule

module comparator(y, t1, s1, t2, s2, t3, s3);
input t1, s1, t2, s2, t3, s3;
output y;

assign y = (~(t1^s1))&(~(t2^s2))&(~(t3^s3));
endmodule

module counter(clk,rst, cnt);
input clk,rst;
output [2:0]cnt;

reg [2:0]cnt;
wire [2:0]next_cnt;

assign next_cnt = cnt + 1'b1;

always @ (posedge clk or negedge rst)   
begin
 if(!rst)
 begin
 cnt <= 3'b0;
 end
 else
 begin
 cnt <= next_cnt;
 end
end

endmodule