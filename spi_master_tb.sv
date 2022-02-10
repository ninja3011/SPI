// Code your testbench here
// or browse Examples
module spi_master_tb(); //TestBench code start
  reg miso;
  reg clk;
  wire  mosi;
  wire sck;
  wire nss;
  wire [15:0] bufferReg ;
  reg [15:0] buffer;
  reg [7:0] flag;
  
  integer count;
  spi_master UUT(.miso(miso), .mosi(mosi), .sck(sck), .nss(nss), .clk(clk), .buffer(buffer), .bufferReg(bufferReg) , .flag(flag));

initial
 begin
 
   $monitor(" ",miso," ",mosi," ",clk," ",buffer, " ", bufferReg, " ", flag);


   $dumpfile("dump.vcd");
   $dumpvars;
   $dumpvars(8,miso,mosi,sck,nss,clk, buffer,bufferReg,flag);
 
  miso = 1'b0;
  clk = 1'b0;
   buffer = 16'd10;
   flag = 8'b0;
  for (count = 0; count < 16; count = count + 1'b1) 
  
   begin
     #100
   miso = ~miso;
     
   clk = ~clk;
  
     if(count == 2)begin
       flag = 8'b1;
     end
   
   end
   


end
endmodule //TestBench code end
