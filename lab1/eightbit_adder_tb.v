// testbench Lab1 8-bit adder template
`timescale 1 ns / 10 ps

module adder_unit_tb ();
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] f;
    wire ovf;
   
    eightbit_adder uut (
        .a(a), 
        .b(b), 
        .f(f), 
        .ovf(ovf));

	 // Write your test vectors      
     initial
      begin 

      end
     
endmodule

 