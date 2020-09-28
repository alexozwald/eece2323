`timescale 1ns / 10ps

module adder8_tb_full ();
    reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [7:0] f;
    wire ovf;
    
    eightbit_adder uut
        (.a(a),
         .b(b),
         .f(f),
         .ovf(ovf));
         
    // Test Every Possible Option
    initial
        begin
            #0
            a = 8'b00000000;
            repeat (255)
            begin
                b = 8'b00000000;
                repeat(255)
                begin
                    #5  b = b + 8'b00000001;
                end
                #5  a = a + 8'b00000001;
            end
        #10 $stop;
        end


    // Display Log
    initial
        begin
            $display ("Test of 8-bit adder.");
            $monitor("[a b f ovf]: a=%d  b=%d  f=%d  time=%d", a, b, f, ovf, $time);
        end

endmodule
