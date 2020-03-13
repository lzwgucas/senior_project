

module tb_top;  

    reg               IO_CLK;
    reg               IO_RST_N;
    wire              C_A,C_B,C_C,C_D,C_E,C_F,C_G;
    wire [7:0]  AN1  ;
//    wire [31:0] pc_id_ila_top; //eklendi 10 mart (ila'ya bağlamak için)
    //output logic [31:0] pc_id_ila_top 
    //eklendi 10 mart (ila'ya bağlamak için)
    top_artya7_100 UUT (
        .IO_CLK(IO_CLK),
        .IO_RST_N(IO_RST_N),
        .CA(C_A),
        .CB(C_B),
        .CC(C_C),
        .CD(C_D),
        .CE(C_E),
        .CF(C_F),
        .CG(C_G),
        .AN(AN1)
    );
    

//burayı biz eklemişiz.......
    initial begin 
    IO_CLK = 0;
        IO_RST_N = 0;
        #20 IO_RST_N = 1;
      end
      
      always #10 IO_CLK = ~IO_CLK;
      
endmodule