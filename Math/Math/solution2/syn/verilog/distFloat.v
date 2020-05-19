// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="distFloat,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7vx485t-ffg1157-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.750000,HLS_SYN_LAT=69,HLS_SYN_TPT=none,HLS_SYN_MEM=96,HLS_SYN_DSP=147,HLS_SYN_FF=26346,HLS_SYN_LUT=17949,HLS_VERSION=2019_2}" *)

module distFloat (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x1,
        y1,
        x2,
        y2,
        ap_return
);

parameter    ap_ST_fsm_state1 = 70'd1;
parameter    ap_ST_fsm_state2 = 70'd2;
parameter    ap_ST_fsm_state3 = 70'd4;
parameter    ap_ST_fsm_state4 = 70'd8;
parameter    ap_ST_fsm_state5 = 70'd16;
parameter    ap_ST_fsm_state6 = 70'd32;
parameter    ap_ST_fsm_state7 = 70'd64;
parameter    ap_ST_fsm_state8 = 70'd128;
parameter    ap_ST_fsm_state9 = 70'd256;
parameter    ap_ST_fsm_state10 = 70'd512;
parameter    ap_ST_fsm_state11 = 70'd1024;
parameter    ap_ST_fsm_state12 = 70'd2048;
parameter    ap_ST_fsm_state13 = 70'd4096;
parameter    ap_ST_fsm_state14 = 70'd8192;
parameter    ap_ST_fsm_state15 = 70'd16384;
parameter    ap_ST_fsm_state16 = 70'd32768;
parameter    ap_ST_fsm_state17 = 70'd65536;
parameter    ap_ST_fsm_state18 = 70'd131072;
parameter    ap_ST_fsm_state19 = 70'd262144;
parameter    ap_ST_fsm_state20 = 70'd524288;
parameter    ap_ST_fsm_state21 = 70'd1048576;
parameter    ap_ST_fsm_state22 = 70'd2097152;
parameter    ap_ST_fsm_state23 = 70'd4194304;
parameter    ap_ST_fsm_state24 = 70'd8388608;
parameter    ap_ST_fsm_state25 = 70'd16777216;
parameter    ap_ST_fsm_state26 = 70'd33554432;
parameter    ap_ST_fsm_state27 = 70'd67108864;
parameter    ap_ST_fsm_state28 = 70'd134217728;
parameter    ap_ST_fsm_state29 = 70'd268435456;
parameter    ap_ST_fsm_state30 = 70'd536870912;
parameter    ap_ST_fsm_state31 = 70'd1073741824;
parameter    ap_ST_fsm_state32 = 70'd2147483648;
parameter    ap_ST_fsm_state33 = 70'd4294967296;
parameter    ap_ST_fsm_state34 = 70'd8589934592;
parameter    ap_ST_fsm_state35 = 70'd17179869184;
parameter    ap_ST_fsm_state36 = 70'd34359738368;
parameter    ap_ST_fsm_state37 = 70'd68719476736;
parameter    ap_ST_fsm_state38 = 70'd137438953472;
parameter    ap_ST_fsm_state39 = 70'd274877906944;
parameter    ap_ST_fsm_state40 = 70'd549755813888;
parameter    ap_ST_fsm_state41 = 70'd1099511627776;
parameter    ap_ST_fsm_state42 = 70'd2199023255552;
parameter    ap_ST_fsm_state43 = 70'd4398046511104;
parameter    ap_ST_fsm_state44 = 70'd8796093022208;
parameter    ap_ST_fsm_state45 = 70'd17592186044416;
parameter    ap_ST_fsm_state46 = 70'd35184372088832;
parameter    ap_ST_fsm_state47 = 70'd70368744177664;
parameter    ap_ST_fsm_state48 = 70'd140737488355328;
parameter    ap_ST_fsm_state49 = 70'd281474976710656;
parameter    ap_ST_fsm_state50 = 70'd562949953421312;
parameter    ap_ST_fsm_state51 = 70'd1125899906842624;
parameter    ap_ST_fsm_state52 = 70'd2251799813685248;
parameter    ap_ST_fsm_state53 = 70'd4503599627370496;
parameter    ap_ST_fsm_state54 = 70'd9007199254740992;
parameter    ap_ST_fsm_state55 = 70'd18014398509481984;
parameter    ap_ST_fsm_state56 = 70'd36028797018963968;
parameter    ap_ST_fsm_state57 = 70'd72057594037927936;
parameter    ap_ST_fsm_state58 = 70'd144115188075855872;
parameter    ap_ST_fsm_state59 = 70'd288230376151711744;
parameter    ap_ST_fsm_state60 = 70'd576460752303423488;
parameter    ap_ST_fsm_state61 = 70'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 70'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 70'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 70'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 70'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 70'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 70'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 70'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 70'd295147905179352825856;
parameter    ap_ST_fsm_state70 = 70'd590295810358705651712;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] x1;
input  [31:0] y1;
input  [31:0] x2;
input  [31:0] y2;
output  [63:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [69:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] grp_fu_128_p2;
reg   [31:0] tmp_reg_175;
wire    ap_CS_fsm_state4;
wire   [31:0] grp_fu_134_p2;
reg   [31:0] tmp_s_reg_180;
wire   [63:0] grp_fu_140_p1;
reg   [63:0] x_assign_reg_185;
wire    ap_CS_fsm_state6;
wire   [63:0] grp_fu_143_p1;
reg   [63:0] x_assign_1_reg_190;
wire   [63:0] grp_pow_generic_double_s_fu_70_ap_return;
reg   [63:0] tmp_i_reg_195;
wire    ap_CS_fsm_state44;
wire   [63:0] grp_pow_generic_double_s_fu_99_ap_return;
reg   [63:0] tmp_i1_reg_200;
wire   [63:0] grp_fu_146_p2;
reg   [63:0] x_assign_2_reg_205;
wire    ap_CS_fsm_state49;
wire    grp_pow_generic_double_s_fu_70_ap_start;
wire    grp_pow_generic_double_s_fu_70_ap_done;
wire    grp_pow_generic_double_s_fu_70_ap_idle;
wire    grp_pow_generic_double_s_fu_70_ap_ready;
wire    grp_pow_generic_double_s_fu_99_ap_start;
wire    grp_pow_generic_double_s_fu_99_ap_done;
wire    grp_pow_generic_double_s_fu_99_ap_idle;
wire    grp_pow_generic_double_s_fu_99_ap_ready;
reg    grp_pow_generic_double_s_fu_70_ap_start_reg;
reg   [69:0] ap_NS_fsm;
wire    ap_NS_fsm_state7;
wire    ap_CS_fsm_state7;
reg    grp_pow_generic_double_s_fu_99_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state45;
wire    ap_CS_fsm_state50;
wire   [63:0] grp_fu_150_p2;
wire    ap_CS_fsm_state70;

// power-on initialization
initial begin
#0 ap_CS_fsm = 70'd1;
#0 grp_pow_generic_double_s_fu_70_ap_start_reg = 1'b0;
#0 grp_pow_generic_double_s_fu_99_ap_start_reg = 1'b0;
end

pow_generic_double_s grp_pow_generic_double_s_fu_70(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_pow_generic_double_s_fu_70_ap_start),
    .ap_done(grp_pow_generic_double_s_fu_70_ap_done),
    .ap_idle(grp_pow_generic_double_s_fu_70_ap_idle),
    .ap_ready(grp_pow_generic_double_s_fu_70_ap_ready),
    .base_r(x_assign_reg_185),
    .ap_return(grp_pow_generic_double_s_fu_70_ap_return)
);

pow_generic_double_s grp_pow_generic_double_s_fu_99(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_pow_generic_double_s_fu_99_ap_start),
    .ap_done(grp_pow_generic_double_s_fu_99_ap_done),
    .ap_idle(grp_pow_generic_double_s_fu_99_ap_idle),
    .ap_ready(grp_pow_generic_double_s_fu_99_ap_ready),
    .base_r(x_assign_1_reg_190),
    .ap_return(grp_pow_generic_double_s_fu_99_ap_return)
);

distFloat_fsub_32yd2 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
distFloat_fsub_32yd2_U36(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(x2),
    .din1(x1),
    .ce(1'b1),
    .dout(grp_fu_128_p2)
);

distFloat_fsub_32yd2 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
distFloat_fsub_32yd2_U37(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(y2),
    .din1(y1),
    .ce(1'b1),
    .dout(grp_fu_134_p2)
);

distFloat_fpext_3zec #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
distFloat_fpext_3zec_U38(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_reg_175),
    .ce(1'b1),
    .dout(grp_fu_140_p1)
);

distFloat_fpext_3zec #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
distFloat_fpext_3zec_U39(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_s_reg_180),
    .ce(1'b1),
    .dout(grp_fu_143_p1)
);

distFloat_dadd_64Aem #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
distFloat_dadd_64Aem_U40(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_i_reg_195),
    .din1(tmp_i1_reg_200),
    .ce(1'b1),
    .dout(grp_fu_146_p2)
);

distFloat_dsqrt_6Bew #(
    .ID( 1 ),
    .NUM_STAGE( 21 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
distFloat_dsqrt_6Bew_U41(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(64'd0),
    .din1(x_assign_2_reg_205),
    .ce(1'b1),
    .dout(grp_fu_150_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_pow_generic_double_s_fu_70_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state7) & (1'b1 == ap_CS_fsm_state6))) begin
            grp_pow_generic_double_s_fu_70_ap_start_reg <= 1'b1;
        end else if ((grp_pow_generic_double_s_fu_70_ap_ready == 1'b1)) begin
            grp_pow_generic_double_s_fu_70_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_pow_generic_double_s_fu_99_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state7) & (1'b1 == ap_CS_fsm_state6))) begin
            grp_pow_generic_double_s_fu_99_ap_start_reg <= 1'b1;
        end else if ((grp_pow_generic_double_s_fu_99_ap_ready == 1'b1)) begin
            grp_pow_generic_double_s_fu_99_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state44)) begin
        tmp_i1_reg_200 <= grp_pow_generic_double_s_fu_99_ap_return;
        tmp_i_reg_195 <= grp_pow_generic_double_s_fu_70_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        tmp_reg_175 <= grp_fu_128_p2;
        tmp_s_reg_180 <= grp_fu_134_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        x_assign_1_reg_190 <= grp_fu_143_p1;
        x_assign_reg_185 <= grp_fu_140_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state49)) begin
        x_assign_2_reg_205 <= grp_fu_146_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state70)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state70)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state68;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state70;
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state44 = ap_CS_fsm[32'd43];

assign ap_CS_fsm_state45 = ap_CS_fsm[32'd44];

assign ap_CS_fsm_state49 = ap_CS_fsm[32'd48];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state50 = ap_CS_fsm[32'd49];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state70 = ap_CS_fsm[32'd69];

assign ap_NS_fsm_state7 = ap_NS_fsm[32'd6];

assign ap_return = grp_fu_150_p2;

assign grp_pow_generic_double_s_fu_70_ap_start = grp_pow_generic_double_s_fu_70_ap_start_reg;

assign grp_pow_generic_double_s_fu_99_ap_start = grp_pow_generic_double_s_fu_99_ap_start_reg;

endmodule //distFloat