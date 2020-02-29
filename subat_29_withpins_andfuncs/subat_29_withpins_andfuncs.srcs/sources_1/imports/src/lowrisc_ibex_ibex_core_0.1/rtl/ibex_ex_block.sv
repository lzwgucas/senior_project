// Copyright lowRISC contributors.
// Copyright 2018 ETH Zurich and University of Bologna, see also CREDITS.md.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/**
 * Execution stage
 *
 * Execution block: Hosts ALU and MUL/DIV unit
 */
module ibex_ex_block #(
    parameter bit RV32M = 1
) (
    input  logic              clk_i,
    input  logic              rst_ni,
    
    //our module
     input logic [31:0] custom_in_RS1_i ,
     input logic [31:0] custom_in_RS2_i ,
     input logic custom_en_i,
     input logic [31:0] ram_data_ex_i, //ram'den GELEN data  //biz ekledik 16.01.2020
     output logic [13:0] ram_addr_out , //ram'e GİDECEK olan adres  //biz ekledik 16.01.2020
     output logic custom_valid,
     output logic [31:0] custom_data,
     input [4:0] custom_op_i,
    // rd nereye gidicek outputta belli olucak
    //***/////
    
    // ALU
    input  ibex_pkg::alu_op_e alu_operator_i,
    input  logic [31:0]       alu_operand_a_i,
    input  logic [31:0]       alu_operand_b_i,

    // Multiplier/Divider
    input  ibex_pkg::md_op_e  multdiv_operator_i,
    input  logic              mult_en_i,
    input  logic              div_en_i,
    input  logic  [1:0]       multdiv_signed_mode_i,
    input  logic [31:0]       multdiv_operand_a_i,
    input  logic [31:0]       multdiv_operand_b_i,

    // Outputs
    output logic [31:0]       alu_adder_result_ex_o, // to LSU
    output logic [31:0]       regfile_wdata_ex_o,
    output logic [31:0]       jump_target_o,         // to IF
    output logic              branch_decision_o,     // to ID

    output logic              ex_valid_o             // EX has valid output
);



  import ibex_pkg::*;

  localparam bit MULT_TYPE = 1; // 0 -> SLOW, 1 -> FAST

  logic [31:0] alu_result, multdiv_result;
  logic [31:0] custom_result;  //  biz ekledik  09.12.19
  logic [31:0] ram_data_ex;  //ram'den GELEN data  //biz ekledik 16.01.2020
  logic [13:0] ram_addr_out_k;  //ram'e GİDECEK olan adres //biz ekledik 16.01.2020
  logic custom_valid_ex;
  logic custom_final;
  logic [31:0] custom_data_ex;
  logic [4:0] custom_op_ex;
    
    assign custom_op_ex = custom_op_i ;
    assign custom_valid = custom_valid_ex;
    assign custom_data = custom_data_ex;
    assign ram_addr_out = ram_addr_out_k;
    assign ram_data_ex = ram_data_ex_i;

  logic [32:0] multdiv_alu_operand_b, multdiv_alu_operand_a;
  logic [33:0] alu_adder_result_ext;
  logic        alu_cmp_result, alu_is_equal_result;
  logic        multdiv_valid, multdiv_en_sel;
  logic        multdiv_en;

  /*
    The multdiv_i output is never selected if RV32M=0
    At synthesis time, all the combinational and sequential logic
    from the multdiv_i module are eliminated
  */
  if (RV32M) begin : gen_multdiv_m
    assign multdiv_en_sel     = MULT_TYPE ? div_en_i : mult_en_i | div_en_i;
    assign multdiv_en         = mult_en_i | div_en_i;
  end else begin : gen_multdiv_no_m
    assign multdiv_en_sel     = 1'b0;
    assign multdiv_en         = 1'b0;
  end
  
  //** ekledik 09.12.19
    assign regfile_wdata_ex_o =  custom_en_i ? custom_result: ( multdiv_en ? multdiv_result : alu_result);

    
//    assign regfile_wdata_ex_o = multdiv_en ? multdiv_result : alu_result; //yalnızca bu satır var idi
    //******

  // branch handling
  assign branch_decision_o  = alu_cmp_result;
  assign jump_target_o      = alu_adder_result_ex_o;

//***//
custom_module cust_i(
    .custom_en(custom_en_i),
    .array1_addr(custom_in_RS1_i),
    .array2_addr(custom_in_RS2_i),
    .custom_result(custom_result),
    .custom_data(custom_data_ex),
    .clk(clk_i),
    .ram_data_in(ram_data_ex),  //ram'den GELEN data
    .ram_addr_out(ram_addr_out_k), //ram'e GİDEN data
    .custom_valid(custom_valid_ex),
    .custom_final(custom_final),
    .custom_op(custom_op_ex)
);
//****** 09.12.19  düzenlendi 16.01.2020

  /////////
  // ALU //
  /////////

  ibex_alu alu_i (
      .operator_i          ( alu_operator_i            ),
      .operand_a_i         ( alu_operand_a_i           ),
      .operand_b_i         ( alu_operand_b_i           ),
      .multdiv_operand_a_i ( multdiv_alu_operand_a     ),
      .multdiv_operand_b_i ( multdiv_alu_operand_b     ),
      .multdiv_en_i        ( multdiv_en_sel            ),
      .adder_result_o      ( alu_adder_result_ex_o     ),
      .adder_result_ext_o  ( alu_adder_result_ext      ),
      .result_o            ( alu_result                ),
      .comparison_result_o ( alu_cmp_result            ),
      .is_equal_result_o   ( alu_is_equal_result       )
  );

  ////////////////
  // Multiplier //
  ////////////////

  if (!MULT_TYPE) begin : gen_multdiv_slow
    ibex_multdiv_slow multdiv_i (
        .clk_i              ( clk_i                 ),
        .rst_ni             ( rst_ni                ),
        .mult_en_i          ( mult_en_i             ),
        .div_en_i           ( div_en_i              ),
        .operator_i         ( multdiv_operator_i    ),
        .signed_mode_i      ( multdiv_signed_mode_i ),
        .op_a_i             ( multdiv_operand_a_i   ),
        .op_b_i             ( multdiv_operand_b_i   ),
        .alu_adder_ext_i    ( alu_adder_result_ext  ),
        .alu_adder_i        ( alu_adder_result_ex_o ),
        .equal_to_zero      ( alu_is_equal_result   ),
        .valid_o            ( multdiv_valid         ),
        .alu_operand_a_o    ( multdiv_alu_operand_a ),
        .alu_operand_b_o    ( multdiv_alu_operand_b ),
        .multdiv_result_o   ( multdiv_result        )
    );
  end else begin : gen_multdiv_fast
    ibex_multdiv_fast multdiv_i (
        .clk_i              ( clk_i                 ),
        .rst_ni             ( rst_ni                ),
        .mult_en_i          ( mult_en_i             ),
        .div_en_i           ( div_en_i              ),
        .operator_i         ( multdiv_operator_i    ),
        .signed_mode_i      ( multdiv_signed_mode_i ),
        .op_a_i             ( multdiv_operand_a_i   ),
        .op_b_i             ( multdiv_operand_b_i   ),
        .alu_operand_a_o    ( multdiv_alu_operand_a ),
        .alu_operand_b_o    ( multdiv_alu_operand_b ),
        .alu_adder_ext_i    ( alu_adder_result_ext  ),
        .alu_adder_i        ( alu_adder_result_ex_o ),
        .equal_to_zero      ( alu_is_equal_result   ),
        .valid_o            ( multdiv_valid         ),
        .multdiv_result_o   ( multdiv_result        )
    );
  end  // ALU output valid in same cycle, multiplier/divider may require multiple cycles
 
 //multiclock cycle için biz ekledik 20.01.2020
  assign ex_valid_o = custom_en_i ? custom_final : (multdiv_en ? multdiv_valid : 1'b1);

endmodule
