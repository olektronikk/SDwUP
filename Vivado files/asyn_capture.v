`timescale 1ns / 1ps



module asyn_capture (Q,QFlag,reset,Qreg);
    input wire[3:0] Q;
    input wire      reset;
    output reg      QFlag;
    output reg[3:0] Qreg;
    
    always@(*)
        begin
            if (reset) 
		QFlag <=0;
            else if(Q == 0) 
		QFlag <=0;
            else 
                begin 
                    QFlag <=1; 
                end
        end
       
    always @ (posedge QFlag) begin
        Qreg <= Q;
    end   
        
endmodule

