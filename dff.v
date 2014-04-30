module dff(
  output reg Q,
  input D, CLK);
  
  reg q;
  
  always @(posedge CLK)
      assign q = D;
      
  always @(negedge CLK)
    assign Q = q;
    
  endmodule