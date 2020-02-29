// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

module top_artya7_100 (
    input               IO_CLK,
    input               IO_RST_N,
//    output [31:0]        out,
    output CA, CB, CC, CD, CE, CF, CG,
    output logic [7:0] AN
);

  parameter int          MEM_SIZE  = 64 * 1024; // 64 kB
  parameter logic [31:0] MEM_START = 32'h00000000;
  parameter logic [31:0] MEM_MASK  = MEM_SIZE-1;

  logic clk_sys, rst_sys_n;
  // eklendi 25.02.2020 
  logic [31:0] out; // eklendi 25.02.2020 
  
  // Instruction connection to SRAM
  logic        instr_req;
  logic        instr_gnt;
  logic        instr_rvalid;
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;

  // Data connection to SRAM
  logic        data_req;
  logic        data_gnt;
  logic        data_rvalid;
  logic        data_we;
  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;

  // SRAM arbiter
  logic [13:0] mem_addr_index;
  logic        mem_req;
  logic        mem_write;
  logic [31:0] mem_wdata;
  logic        mem_rvalid;
  logic [31:0] mem_rdata;
  
   //biz ekledik 16.01.2020
logic [31:0] ram_data_top ;
     logic [13:0] ram_addr_out_ex_o;
     logic custom_enable;
     logic custom_valid;
     logic [31:0] custom_data;
       //biz ekledik 16.01.2020

         ibex_core #(
            .DmHaltAddr(32'h00000000),
            .DmExceptionAddr(32'h00000000)
         ) u_core (
            .clk_i                 (clk_sys),
            .rst_ni                (rst_sys_n),
       
            .test_en_i             ('b0),
       
            .hart_id_i             (32'b0),
            // First instruction executed is at 0x0 + 0x80
            .boot_addr_i           (32'h00000000),
       
            .instr_req_o           (instr_req),
            .instr_gnt_i           (instr_gnt),
            .instr_rvalid_i        (instr_rvalid),
            .instr_addr_o          (instr_addr),
            .instr_rdata_i         (instr_rdata),
            .instr_err_i           ('b0),
             //biz ekledik 16.01.2020
            .ram_data_core_i(ram_data_top),
            .ram_addr_out_ex(ram_addr_out_ex_o),
            .custom_en_ex(custom_enable),
            .custom_valid_ex(custom_valid),
            .custom_data_ex(custom_data),
             //biz ekledik 16.01.2020
       
            .data_req_o            (data_req),
            .data_gnt_i            (data_gnt),
            .data_rvalid_i         (data_rvalid),
            .data_we_o             (data_we),
            // TODO: Byte access needs to be implemented
            .data_be_o             (),
            .data_addr_o           (data_addr),
            .data_wdata_o          (data_wdata),
            .data_rdata_i          (data_rdata),
            .data_err_i            ('b0),
       
            .irq_software_i        (1'b0),
            .irq_timer_i           (1'b0),
            .irq_external_i        (1'b0),
            .irq_fast_i            (15'b0),
            .irq_nm_i              (1'b0),
       
            .debug_req_i           ('b0),
       
            .fetch_enable_i        ('b1),
            .core_sleep_o          ()
         );
       
         // Connect Ibex to SRAM
         always_comb begin
           mem_req        = 1'b0;
           mem_addr_index = 14'b0;
           mem_write      = 1'b0;
           mem_wdata      = 32'b0;
           if (instr_req) begin
             mem_req        = (instr_addr & ~MEM_MASK) == MEM_START;
             mem_addr_index = instr_addr[15:2];
           end else if (data_req) begin
             mem_req        = (data_addr & ~MEM_MASK) == MEM_START;
             mem_write      = data_we;
             mem_addr_index = data_addr[15:2];
             mem_wdata      = data_wdata;
           end else if (custom_enable) begin
             mem_req = 1;
             mem_addr_index = ram_addr_out_ex_o;
                 if (custom_valid) begin
                 mem_wdata = custom_data;
                 mem_write = 1;
                 end
         end
         end
       
         // SRAM block for instruction and data storage
         ram_1p #(
           .Width(32),
           .Depth(MEM_SIZE / 4)
         ) u_ram (
           .clk_i     ( clk_sys        ),
           .rst_ni    ( rst_sys_n      ),
           .req_i     ( mem_req        ),
           .write_i   ( mem_write      ),
           .addr_i    ( mem_addr_index ),
           .wdata_i   ( mem_wdata      ),
           .rvalid_o  ( mem_rvalid     ),
           .rdata_o   ( mem_rdata      )
         );
       
         // SRAM to Ibex
         assign instr_rdata    = mem_rdata;
         assign data_rdata     = mem_rdata;
         //eklendi
         assign ram_data_top = mem_rdata;
         //
         assign instr_rvalid   = mem_rvalid;
         always_ff @(posedge clk_sys or negedge rst_sys_n) begin
           if (!rst_sys_n) begin
             instr_gnt    <= 'b0;
             data_gnt     <= 'b0;
             data_rvalid  <= 'b0;
           end else begin
             instr_gnt    <= instr_req && mem_req;
             data_gnt     <= ~instr_req && data_req && mem_req;
             data_rvalid  <= ~instr_req && data_req && mem_req;
           end
         end


  // Connect the led output to the lower four bits of a written data word
  logic [31:0] leds;
  always_ff @(posedge clk_sys or negedge rst_sys_n) begin
    if (!rst_sys_n) begin
      leds <= 32'b0;
    end else begin
      if (mem_req && (custom_enable || (data_req && data_we))) begin    //17.01.2020
        leds <= data_wdata[31:0];
      end
    end
  end
  assign out = leds;
    
    
//// eklendi: 25.02.2020
//    logic [31:0] out;
    logic [2:0] state =3'b000;  
//    logic [7:0] AN;
    logic [3:0] i=4'b0;
//    logic CA, CB, CC, CD, CE, CF, CG;
    logic [3:0] convert_data;
    always@(posedge clk_sys) begin  //**??
        case (state) 
//            3'b000: begin
//                  AN[i] = 1; 
//                  convert_data = out[i*4 +:3];   //i*4+3 : i*4 aralığını vericek
                  
//                state <= state +1;
//            end 
            
//            3'b001: begin
////                i = i+1;
//                i = i+1;
//                AN = 8'b0;
//                if (i == 8) begin
//                    state <=state+1;  end 
//                else state <= 3'b000;
//            end 
            
//            3'b010: begin
//            state <=state+1;
//            end
//            default: begin 
//                i=0;
//                state = 0;
//            end  
            
            3'b000: begin
            AN = 8'd1;
            convert_data = out[3:0];
            state <= state+1;
            end
            3'b001: begin
            AN = 8'd2;
            convert_data = out[7:4];
            state <= state+1;
            end
            3'b010: begin
            AN = 8'd4;
            convert_data = out[11:8];
            state <= state+1;
            end
            3'b011: begin
            AN = 8'd8;
            convert_data = out[15:12];
            state <= state+1;
            end
            3'b100: begin
            AN = 8'd16;
            convert_data = out[19:16];
            state <= state+1;
            end
            3'b101: begin
            AN = 8'd32;
            convert_data = out[23:20];
            state <= state+1;
            end
            3'b110: begin
            AN = 8'd64;
            convert_data = out[27:24];
            state <= state+1;
            end
            3'b111: begin
            AN = 8'd128;
            convert_data = out[31:28];
            state <= 3'b0;
            end
           
        endcase
    end
//    logic x_IO_CLK;
//    assign x_IO_CLK = IO_CLK;
    Binary_To_7Segment display_module(clk_sys, convert_data, CA,CB,CC,CD,CE,CF,CG);
       
//// eklendi: 25.02.2020
    
  // Clock and reset
  clkgen_xil7series
    clkgen(
      .IO_CLK(IO_CLK),
      .IO_RST_N(IO_RST_N),
      .clk_sys(clk_sys),
      .rst_sys_n(rst_sys_n)
    );

endmodule