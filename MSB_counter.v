`timescale 1ns / 1ps

//ADAM WALSH
//17329906
//LABF 
//completed 1/04/2020
//N=19 bits, feedback =XOR

module MSB_counter(clk, sh_en, rst_n, MSB, max_tick, c0, c1);
    
    input clk, sh_en, rst_n, MSB, max_tick;
    //2 counters needed, high and low
    output  reg [40:0] c0;
    output  reg [40:0] c1;
    //when reset drops, begin counting
    always @(posedge clk, negedge rst_n) begin
        if(rst_n) begin
            c1 <= 0;
            c0 <= 0;
        end
        else begin
            if(!max_tick) begin //as long as max tick is low, continue counting
                if(MSB) begin //correct counters assigned to high and low
                    c1 <= c1 + 1'b1;
                end
                else begin
                    c0 <= c0 +1'b1;
                end
            end
            else begin //when max tick goes high, reset counters
                c1 <= 0;
                c0 <= 0;
            end
        end
     end           
    //else begin
     //   assign high counter = 10'b0;
        //assign low_counter = '0;
    //end
    //end

endmodule
