`timescale 1ns / 1ps
//ADAM WALSH
//17329906
//LABF 
//completed 1/04/2020
//N=19 bits, feedback =XOR



module lfsr_mod
    #(parameter	seed = 10'h1)	
    (input clk, sh_en, rst_n,	
    output [18:0] Q_out,
    output max_tick_o,
    output msb);	
    	
    reg [18:0]	Q_state;	
    wire [18:0]	Q_ns;	
    wire Q_fb;
    reg max_tick_r;
    //reg msb_check;
    
    //clock set up to set q state as seed to begin, and later assigning it to the xor output
    always @ (posedge clk, negedge rst_n) begin	
        if(rst_n)	
            Q_state	<=	seed;
        else if(sh_en)
            Q_state	<=	Q_ns;
            //msb_check = Q_out[18];
    end	
          
      
    //logic for 4 input XOR
    assign	Q_fb = Q_state[18] ^ Q_state[5] ^ Q_state[1] ^ Q_state[0];	
    assign	Q_ns = {Q_state[17:0],Q_fb};	
    //output	logic
    assign	Q_out	=	Q_state;
    //assign msb = Q_state[18];
    
    //always block for max tick signal
    //essentially sets max tick high when the new reg value is equal to the seed
    always @*
    begin 
        if(!rst_n) begin
            if(Q_out == seed) begin
                max_tick_r = 1'b1;
            end
            else begin 
            max_tick_r = 1'b0;
            end
        end
        else begin
            max_tick_r = 1'b0;
        end
    end
    //correctly assigning outputs
    assign max_tick_o = max_tick_r; 
    assign msb = Q_state[18];

    	
endmodule
  

