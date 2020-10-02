`timescale 1ns / 1ps
//ADAM WALSH
//17329906
//LABF 
//completed 1/04/2020
//N=19 bits, feedback =XOR


module lfsr_tb();
    localparam T = 20;
    reg tb_clk, tb_sh_en, tb_rst_n;	
    wire [18:0] test_q;
    wire tb_max_tick;
    wire [40:0] tb_highC;
    wire [40:0] tb_lowC;
    wire tb_msb;
    
    //instantiating the modules
    lfsr_mod #(10'h2c9) uut (.clk(tb_clk), .rst_n(tb_rst_n), .Q_out(test_q), .sh_en(tb_sh_en), .max_tick_o(tb_max_tick), .msb(tb_msb));
    MSB_counter msbCALC(.clk(tb_clk), .rst_n(tb_rst_n), .sh_en(tb_sh_en), .MSB(tb_msb), .max_tick(tb_max_tick), .c1(tb_highC), .c0(tb_lowC));
    
    //setting clock and reset
    always 
    begin
        tb_clk = 1'b1;
        #(T/2);
        tb_clk = 1'b0;
        #(T/2);
    end
    
    initial
    begin
        tb_sh_en = 1'b1; //sh_en as used in notes
        tb_rst_n = 1'b1;
        #(10*T);
        tb_rst_n = 1'b0;

    end


endmodule
