// Code your design here
module spi_master(clk, mosi, miso, sck, nss, buffer,bufferReg, flag); //DUT code start
  input  miso;
  input  clk;
  output reg  mosi;
  output sck;
  output  nss;
  input reg [15:0] buffer;
  
  reg clear = 0;
  output wire [15:0] bufferReg;
  reg [15:0] shiftReg = 16'b10;
  input reg [7:0 ]flag; 	
always @(posedge clk )
  begin
    if(flag == 8'b0)begin
    shiftReg = buffer;
    end
    if (clear)
    shiftReg <= 16'b0;
    else
    shiftReg <= shiftReg >> 1;
    shiftReg[15] <= miso;
    mosi = shiftReg[0];
    end
assign bufferReg = shiftReg;
  
endmodule //DUT code end
