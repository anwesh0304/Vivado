-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity array_FIFO is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    d_o_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    d_o_full_n : IN STD_LOGIC;
    d_o_write : OUT STD_LOGIC;
    d_i_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    d_i_empty_n : IN STD_LOGIC;
    d_i_read : OUT STD_LOGIC;
    idx_address0 : OUT STD_LOGIC_VECTOR (1 downto 0);
    idx_ce0 : OUT STD_LOGIC;
    idx_we0 : OUT STD_LOGIC;
    idx_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    idx_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    idx_address1 : OUT STD_LOGIC_VECTOR (1 downto 0);
    idx_ce1 : OUT STD_LOGIC;
    idx_we1 : OUT STD_LOGIC;
    idx_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    idx_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of array_FIFO is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "array_FIFO,hls_ip_2019_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160t-fbg484-1,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.500000,HLS_SYN_LAT=5,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=5,HLS_SYN_LUT=69,HLS_VERSION=2019_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal d_o_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln100_fu_63_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal d_i_blk_n : STD_LOGIC;
    signal i_fu_69_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_state2 : BOOLEAN;
    signal i_0_reg_52 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    i_0_reg_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_0_reg_52 <= i_fu_69_p2;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_0_reg_52 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, d_o_full_n, d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state2_assign_proc : process(d_o_full_n, d_i_empty_n, icmp_ln100_fu_63_p2)
    begin
                ap_block_state2 <= (((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(d_o_full_n, d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(d_o_full_n, d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    d_i_blk_n_assign_proc : process(d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if (((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            d_i_blk_n <= d_i_empty_n;
        else 
            d_i_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    d_i_read_assign_proc : process(d_o_full_n, d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            d_i_read <= ap_const_logic_1;
        else 
            d_i_read <= ap_const_logic_0;
        end if; 
    end process;


    d_o_blk_n_assign_proc : process(d_o_full_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if (((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            d_o_blk_n <= d_o_full_n;
        else 
            d_o_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    d_o_din <= d_i_dout;

    d_o_write_assign_proc : process(d_o_full_n, d_i_empty_n, ap_CS_fsm_state2, icmp_ln100_fu_63_p2)
    begin
        if ((not((((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_o_full_n = ap_const_logic_0)) or ((icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (d_i_empty_n = ap_const_logic_0)))) and (icmp_ln100_fu_63_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            d_o_write <= ap_const_logic_1;
        else 
            d_o_write <= ap_const_logic_0;
        end if; 
    end process;

    i_fu_69_p2 <= std_logic_vector(unsigned(i_0_reg_52) + unsigned(ap_const_lv3_1));
    icmp_ln100_fu_63_p2 <= "1" when (i_0_reg_52 = ap_const_lv3_4) else "0";
    idx_address0 <= ap_const_lv2_0;
    idx_address1 <= ap_const_lv2_0;
    idx_ce0 <= ap_const_logic_0;
    idx_ce1 <= ap_const_logic_0;
    idx_d0 <= ap_const_lv32_0;
    idx_d1 <= ap_const_lv32_0;
    idx_we0 <= ap_const_logic_0;
    idx_we1 <= ap_const_logic_0;
end behav;
