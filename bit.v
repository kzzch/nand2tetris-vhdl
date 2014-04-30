module bit(
  output out,
  input in, load, clock);
  
  wire in0;
  
  mux
    mux0(in0, load, out, in);
  dff
    dff0(out, in0, clock);
  
endmodule

module b_bit(
  output reg out,
  input reg in, load, clock);
  reg q;
  
  always @(load)
    if(load)
      assign q = in;
    else
      assign q = q;
  
  always @(negedge clock)
    assign out = q;

endmodule

module m555
  (output reg clock);
  
  initial
  #5 clock = 1;
  
  always
  #10 clock = ~clock;
endmodule

module test_bit(
  input reg out,
  output reg in, load);
  
  wire clock;
  
  bit b (out, in, load, clock);
  m555 clockGen (clock);
  
  
    initial
      begin
    $monitor($time,,,
    "clock = %b in = %b, load = %b, out = %b", 
    clock, in, load, out);

    #0 in = 0; load = 0;
    #20 load = 1;
    #40 in = 1; load = 0;
    #60 load = 1;
    #80 in = 0; load = 0;
    #100 in = 1;
    #120 in = 0; load = 1;
    #140 in = 1;
    #160 in = 0; load = 0;
    #960 load = 1;
    #980 in = 1; load = 0;
    #1760 load = 0; in = 0;
    $stop;
    
  end
endmodule

module test_b_bit(
  input reg out,
  output reg in, load);
  
  wire clock;
  b_bit b (out, in, load, clock);
  
  m555  clockGen (clock);
  

    initial
      begin
    $monitor($time,,,
    "clock = %b in = %b, load = %b, out = %b", 
    clock, in, load, out);

    #0 in = 0; load = 0;
    #20 load = 1;
    #40 in = 1; load = 0;
    #60 load = 1;
    #80 in = 0; load = 0;
    #100 in = 1;
    #120 in = 0; load = 1;
    #140 in = 1;
    #160 in = 0; load = 0;
    #960 load = 1;
    #980 in = 1; load = 0;
    #1760 load = 0; in = 0;
    #4000 $stop;
    
  end

    
endmodule