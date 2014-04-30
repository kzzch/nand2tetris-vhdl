/**
 * Half adder. Computes sum, the least significnat bit of a + b,
 * and carry, the most significnat bit of a + b.
 *
 * Adapted from the book "The Elements of Computing Systems" by
 * Nisan and Schocken, MIT Press.
 *
 */
 
module halfAdder(
  output sum, carry,
  input a, b);
  
  and
    a0(carry, a, b);
    
  xor
    x0(sum, a, b);
  
endmodule