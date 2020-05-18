// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _find_HH_
#define _find_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct find : public sc_module {
    // Port declarations 13
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<8> > val_r;
    sc_in< sc_lv<8> > in_vec_dout;
    sc_in< sc_logic > in_vec_empty_n;
    sc_out< sc_logic > in_vec_read;
    sc_out< sc_lv<8> > out_vec_din;
    sc_in< sc_logic > out_vec_full_n;
    sc_out< sc_logic > out_vec_write;


    // Module declarations
    find(sc_module_name name);
    SC_HAS_PROCESS(find);

    ~find();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<2> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > in_vec_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<1> > icmp_ln6_fu_66_p2;
    sc_signal< sc_logic > out_vec_blk_n;
    sc_signal< sc_lv<4> > idx_fu_72_p2;
    sc_signal< bool > ap_block_state2;
    sc_signal< sc_lv<4> > idx_0_reg_55;
    sc_signal< sc_lv<1> > icmp_ln8_fu_78_p2;
    sc_signal< sc_lv<2> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<2> ap_ST_fsm_state1;
    static const sc_lv<2> ap_ST_fsm_state2;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<4> ap_const_lv4_A;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_block_state2();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_icmp_ln6_fu_66_p2();
    void thread_icmp_ln8_fu_78_p2();
    void thread_idx_fu_72_p2();
    void thread_in_vec_blk_n();
    void thread_in_vec_read();
    void thread_out_vec_blk_n();
    void thread_out_vec_din();
    void thread_out_vec_write();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
