/**
 * Full adder. Computes sum, the least significant bit of 
 * a + b + c, and carry, the most significant bit of a + b + c.
 *
 * Adapted from the book "The Elements of Computing Systems" by
 * Nisan and Schocken, MIT Press.
 */
 
module fullAdder(
  output sum, carry,
  input a, b, c);
  
  wire s1, c1, c2;
  
  halfAdder
    ha0(s1, c1, b, c),
    ha1(sum, c2, s1, a);
  
  or
    or0(carry, c1, c2);
    
endmodule