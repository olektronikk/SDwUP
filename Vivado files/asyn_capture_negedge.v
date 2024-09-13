`timescale 1ns / 1ps



module asyn_capture_negedge (Q,QFlag,reset,Qreg);
    input wire[3:0] Q;
    input wire      reset;
    output reg      QFlag;
    output reg[3:0] Qreg;

    
    reg[3:0] r_Qreg =0;
    
    always@(*)
        begin
            if (reset) 
		          QFlag <=0;
            else if(Q == 4'b1111)  
		          QFlag = 1;
            else
                  QFlag <=0;
        end
       
    always @ (negedge QFlag) begin
        Qreg <= Q;
    end   
        
endmodule


