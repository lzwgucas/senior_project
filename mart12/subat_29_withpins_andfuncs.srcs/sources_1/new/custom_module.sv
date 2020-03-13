`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2019 08:09:43 PM
// Design Name: 
// Module Name: custom_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  TEMEL AMAC IKI ARRAY ALIP HER ELEMANININ CARPIMINI BASKA BIR ARRAYE YAZMAK
//  SORUN!! : YAZILACAK ARRAY'IN ADRESI NASIL BELLI OLCAK??
//////////////////////////////////////////////////////////////////////////////////





module custom_module(
    input logic custom_en,
    input logic [31:0] array1_addr,  //operand_a
    input logic [31:0] array2_addr,      //operand_b
    output logic [31:0] custom_result,  //adress of the result array
    output logic [31:0] custom_data,    //ram'in data girisine bagli olan sey bu
    input logic clk,
    input logic [31:0] ram_data_in, //ram'den GELEN data
    output logic [13:0] ram_addr_out,  //ram'e GİDECEK olan adres
    output logic custom_valid,   //top module kadar giden cikis, aslında amacı write enable olmak
    output logic custom_final,   //instruction'ın son durumunda set ediliyor sonucu yollamak icin
    input logic [4:0] custom_op,
    output logic custom_mod_o,
    output logic [31:0] custom_op_a_o [2:0],  //bunların kullanım yerleri yazılmalı!
    output logic [31:0] custom_op_b_o,
    input logic [31:0] custom_mod_result [2:0],
    input logic mod_valid
    ); 
    
    reg [4:0] custom_op_temp;
    reg [13:0] array1_addr_temp;
    reg [13:0] array2_addr_temp;
    
    reg [31:0] data_reg1 [2:0] ;
    reg [31:0] data_reg2 [2:0] ;
    reg [31:0] data_reg3 [2:0] ;
    integer addr_check,counter=0,i=0, array_length=3;
    logic [3:0] state=0;
    logic [31:0] mod;
    logic [3:0] k = 0;    // this variable changes according to array_length
    logic custom_mod;
    
    assign custom_mod_o = custom_mod;
    
    always@(posedge clk)
    begin case (state)
    
    1 :begin  //Adres Yolla
    
        if(addr_check==0) begin
            if(custom_op_temp == 6) begin
 //// mod islemi icin yapilacaklar buradan baslayacak!!! NEGATIFSE +MOD ISLEMINI UNUTMA////
               for(int k=0;k<array_length;k++) begin
                    if(data_reg1[k]>32'h7FFFFFFF) begin
                    
                                           //sayı negatifse
                    data_reg1[k] +=  27*mod;   // mod ile topla
                    end 
                end
            state <= 5;
            end
            else begin
            ram_addr_out <= ((array2_addr_temp)+i);
            state <= state+1;
            end
        end
        else begin
            ram_addr_out <= ((array1_addr_temp)+i);
            state <= state+1;
        end
      
        
        end
    
    2 :begin  //Bekle_1
        
//        if(counter == 1) begin
//        counter = 0;
//        state <= state+2;
//        end
//        else begin
//        counter <= counter+1;
//        state <= state+1;
//        end
        if (i==0) begin
        state<=state+1; 
        end
        else begin 
        state <= state+2;
        end
    end
     
    3 :begin  //Bekle_2
      
        state <= state+1;
   
    end
    
        
    4 :begin  //Veri Gir
    
        if(addr_check==1) begin
        data_reg1[i] <= ram_data_in;        
        if(i == array_length-1) begin
        addr_check = 0;
        i = 0;
        end
        else begin
        i = i+1;
        end            
        state <= 1;
        end
        else if (addr_check==0) begin
            data_reg2[i] <= ram_data_in;
            if(i==array_length-1) begin                    
                state <= state+1;            
                end
            else begin
                i = i+1;
                state <= 1;
                end
        end
        else if (addr_check == 2) begin
            custom_valid <= 1;
            custom_data  <= data_reg3[i];
            if(i==array_length-1) begin                    
            state <= state+2;
            end
            else begin
            i = i+1;
            state <= 1;
            end
        end
        end
    
    5 :begin    //Hesapla
        
//        // array_mul
//        if(custom_op_temp == 1)begin
//        for(int j=0;j<array_length;j++) begin
//                data_reg3[j] = data_reg1[j]*data_reg2[j];   // tradeoff var alan vs performans
//        end
//        end
        
        // array_add
        if (custom_op_temp == 3) begin
        for(int j=0;j<array_length;j++) begin
                        data_reg3[j] = data_reg1[j]+data_reg2[j];   // tradeoff var alan vs performans
        end
        end
        
//        // array_sub
//        else if (custom_op_temp == 4) begin
//        for(int j=0;j<array_length;j++) begin
//                data_reg3[j] = data_reg1[j]-data_reg2[j];   // tradeoff var alan vs performans
//        end
//        end
        
        // array_equ
        else if (custom_op_temp == 5) begin
        for(int j=0;j<array_length;j++) begin
               data_reg3[j] = data_reg2[j];   // daha efektif bir yöntemi var kesin
        end
        end
        
        // array_mod
       else if (custom_op_temp == 6) begin
           custom_mod <= 1'b1;
           custom_op_b_o <= mod;                   
           custom_op_a_o <= data_reg1;

           if (mod_valid==1) begin
               data_reg3 <= custom_mod_result;
               
           end
 
       end

                      
        i = 0;
        addr_check = 2;
        
        if(custom_op_temp == 6 && mod_valid != 1) begin
            state <= 5;
        end

        else state <= 1;
        end        
        

    6  :begin  // Finalize_1     
        custom_final <= 1;
        custom_result <= array1_addr_temp*4;
        i = 0;
        custom_valid <= 0;
        custom_mod <= 0;
        
        state <= state +1;   
    end       
    
    7   :begin  //Finalize_2
   
        for(int i=0;i<array_length;i++) begin
        data_reg3[i] = 32'b0;
        data_reg1[i] = 32'b0;
        data_reg2[i] = 32'b0;  
        end
        state <= 0;
        
    end
    
   
//    custom_mod <= 1'b1;
//    custom_op_b_o <= mod;
    
    
//    custom_op_a_o <= data_reg1[k];
    
//    if(k == array_length-1) begin 
//    data_reg3[k] <= custom_mod_result;
//    state <= 6; 
//    end
//    else if (mod_valid==1) begin
//    data_reg3[k] <= custom_mod_result;
//    k = k+1;
//    end
    
//    end
    
    default: begin
                  
        array1_addr_temp <= array1_addr/4;
        array2_addr_temp <= array2_addr/4;
        mod <= array2_addr;
        custom_op_temp <= custom_op;
        
        custom_op_a_o[0] <= 32'b0;
        custom_op_a_o[1] <= 32'b0;
        custom_op_a_o[2] <= 32'b0;
        custom_op_b_o <= 32'b0;
        custom_mod <= 1'b0;
        
        ram_addr_out <= 14'b0;
        custom_valid <= 1'b0;
        custom_data  <= 32'b0;
        custom_final <= 0;
        
        i = 0;
        addr_check = 1;
        custom_result = 32'b0;
        custom_data = 32'b0;
        k <= 4'b0;
        
        
                
        if(custom_en)   state <= 1; 
        end
        endcase    
    end
endmodule
