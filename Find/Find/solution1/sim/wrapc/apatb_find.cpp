// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "val_r"
#define AUTOTB_TVIN_val_r  "../tv/cdatafile/c.find.autotvin_val_r.dat"
// wrapc file define: "in_vec"
#define AUTOTB_TVIN_in_vec  "../tv/cdatafile/c.find.autotvin_in_vec.dat"
// wrapc file define: "out_vec"
#define AUTOTB_TVOUT_out_vec  "../tv/cdatafile/c.find.autotvout_out_vec.dat"
#define AUTOTB_TVIN_out_vec  "../tv/cdatafile/c.find.autotvin_out_vec.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "out_vec"
#define AUTOTB_TVOUT_PC_out_vec  "../tv/rtldatafile/rtl.find.autotvout_out_vec.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			val_r_depth = 0;
			in_vec_depth = 0;
			out_vec_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{val_r " << val_r_depth << "}\n";
			total_list << "{in_vec " << in_vec_depth << "}\n";
			total_list << "{out_vec " << out_vec_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int val_r_depth;
		int in_vec_depth;
		int out_vec_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void find (
char val,
char in_vec[10],
char out_vec[10]);

void AESL_WRAP_find (
char val,
char in_vec[10],
char out_vec[10])
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "out_vec"
		aesl_fh.read(AUTOTB_TVOUT_PC_out_vec, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_out_vec, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_out_vec, AESL_token); // data

			sc_bv<8> *out_vec_pc_buffer = new sc_bv<8>[10];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'out_vec', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'out_vec', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					out_vec_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_out_vec, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_out_vec))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: out_vec
				{
					// bitslice(7, 0)
					// {
						// celement: out_vec(7, 0)
						// {
							sc_lv<8>* out_vec_lv0_0_9_1 = new sc_lv<8>[10];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: out_vec(7, 0)
						{
							// carray: (0) => (9) @ (1)
							for (int i_0 = 0; i_0 <= 9; i_0 += 1)
							{
								if (&(out_vec[0]) != NULL) // check the null address if the c port is array or others
								{
									out_vec_lv0_0_9_1[hls_map_index].range(7, 0) = sc_bv<8>(out_vec_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: out_vec(7, 0)
						{
							// carray: (0) => (9) @ (1)
							for (int i_0 = 0; i_0 <= 9; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : out_vec[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : out_vec[0]
								// output_left_conversion : out_vec[i_0]
								// output_type_conversion : (out_vec_lv0_0_9_1[hls_map_index]).to_uint64()
								if (&(out_vec[0]) != NULL) // check the null address if the c port is array or others
								{
									out_vec[i_0] = (out_vec_lv0_0_9_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] out_vec_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "val_r"
		char* tvin_val_r = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_val_r);

		// "in_vec"
		char* tvin_in_vec = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_in_vec);

		// "out_vec"
		char* tvin_out_vec = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_out_vec);
		char* tvout_out_vec = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_out_vec);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_val_r, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_val_r, tvin_val_r);

		sc_bv<8> val_r_tvin_wrapc_buffer;

		// RTL Name: val_r
		{
			// bitslice(7, 0)
			{
				// celement: val(7, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : val
						// sub_1st_elem          : 
						// ori_name_1st_elem     : val
						// regulate_c_name       : val
						// input_type_conversion : val
						if (&(val) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> val_tmp_mem;
							val_tmp_mem = val;
							val_r_tvin_wrapc_buffer.range(7, 0) = val_tmp_mem.range(7, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_val_r, "%s\n", (val_r_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_val_r, tvin_val_r);
		}

		tcl_file.set_num(1, &tcl_file.val_r_depth);
		sprintf(tvin_val_r, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_val_r, tvin_val_r);

		// [[transaction]]
		sprintf(tvin_in_vec, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_in_vec, tvin_in_vec);

		sc_bv<8>* in_vec_tvin_wrapc_buffer = new sc_bv<8>[10];

		// RTL Name: in_vec
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: in_vec(7, 0)
				{
					// carray: (0) => (9) @ (1)
					for (int i_0 = 0; i_0 <= 9; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : in_vec[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : in_vec[0]
						// regulate_c_name       : in_vec
						// input_type_conversion : in_vec[i_0]
						if (&(in_vec[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> in_vec_tmp_mem;
							in_vec_tmp_mem = in_vec[i_0];
							in_vec_tvin_wrapc_buffer[hls_map_index].range(7, 0) = in_vec_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 10; i++)
		{
			sprintf(tvin_in_vec, "%s\n", (in_vec_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_in_vec, tvin_in_vec);
		}

		tcl_file.set_num(10, &tcl_file.in_vec_depth);
		sprintf(tvin_in_vec, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_in_vec, tvin_in_vec);

		// release memory allocation
		delete [] in_vec_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_out_vec, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_out_vec, tvin_out_vec);

		sc_bv<8>* out_vec_tvin_wrapc_buffer = new sc_bv<8>[10];

		// RTL Name: out_vec
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: out_vec(7, 0)
				{
					// carray: (0) => (9) @ (1)
					for (int i_0 = 0; i_0 <= 9; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : out_vec[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : out_vec[0]
						// regulate_c_name       : out_vec
						// input_type_conversion : out_vec[i_0]
						if (&(out_vec[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> out_vec_tmp_mem;
							out_vec_tmp_mem = out_vec[i_0];
							out_vec_tvin_wrapc_buffer[hls_map_index].range(7, 0) = out_vec_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 10; i++)
		{
			sprintf(tvin_out_vec, "%s\n", (out_vec_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_out_vec, tvin_out_vec);
		}

		tcl_file.set_num(10, &tcl_file.out_vec_depth);
		sprintf(tvin_out_vec, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_out_vec, tvin_out_vec);

		// release memory allocation
		delete [] out_vec_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		find(val, in_vec, out_vec);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_out_vec, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_out_vec, tvout_out_vec);

		sc_bv<8>* out_vec_tvout_wrapc_buffer = new sc_bv<8>[10];

		// RTL Name: out_vec
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: out_vec(7, 0)
				{
					// carray: (0) => (9) @ (1)
					for (int i_0 = 0; i_0 <= 9; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : out_vec[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : out_vec[0]
						// regulate_c_name       : out_vec
						// input_type_conversion : out_vec[i_0]
						if (&(out_vec[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> out_vec_tmp_mem;
							out_vec_tmp_mem = out_vec[i_0];
							out_vec_tvout_wrapc_buffer[hls_map_index].range(7, 0) = out_vec_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 10; i++)
		{
			sprintf(tvout_out_vec, "%s\n", (out_vec_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_out_vec, tvout_out_vec);
		}

		tcl_file.set_num(10, &tcl_file.out_vec_depth);
		sprintf(tvout_out_vec, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_out_vec, tvout_out_vec);

		// release memory allocation
		delete [] out_vec_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "val_r"
		delete [] tvin_val_r;
		// release memory allocation: "in_vec"
		delete [] tvin_in_vec;
		// release memory allocation: "out_vec"
		delete [] tvout_out_vec;
		delete [] tvin_out_vec;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

