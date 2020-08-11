`timescale 1ns / 1ps
module tb();
reg on =1'b0;
reg clk=1'b0;
wire r,g,y;

tlc dut(on,clk,r,g,y);

always #10 clk=~clk;
initial begin
#10 on=1'b1;
#400 $stop;
end
endmodule
