
/**
 * Dmultiplexor.  
 * {a,b} = {in,0} if sel == 0
 *         {0,in} if sel == 1
 *
 * Adapted from "The Elements of Computer Systems" 
 * by Nisan and Schocken, MIT Press.
 *
 */

module dmux(
  output a, b,
  input in, sel);
  
  not
    not0(nots, sel);
    
  and
    and0(a, in, nots),
    and1(b, in, sel);
endmodule
  