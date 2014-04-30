
/** 
 * Multiplexor. If sel == 1 then out = b else out = a.
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 */
 
module mux
  (output out,
  input sel, a, b);
  
  not
    n0(nots, sel);
    
  and
    a0(aout, a, nots),
    a1(bout, b, sel);
    
  or
    or0(out, aout, bout);

endmodule