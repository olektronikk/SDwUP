`timescale 1ns / 1ps




module f_capture #(

    parameter WIDTH = 8


)(
    input wire clk,
    input wire[3:0] Q,
    output reg F,
    output reg [WIDTH-1:0] f_count

    );
    
reg[WIDTH-1:0] r_f_count;
    
always@(posedge clk)
    if(Q == 4'b1111) 
        begin
        r_f_count <= r_f_count+1;
        F <= 1;
        end
    else
        begin
            if(r_f_count !=0)
                begin
                    f_count <= r_f_count;
                    r_f_count <= 0;
                end
            else
                begin
                    f_count <= f_count;
                    r_f_count <= 0;
                end
        end
endmodule
