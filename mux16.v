/**
 * 16-bit multiplexor. If sel == 1 then out = b else out = a.
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 * Adapted by Jeremiah Biard
 * 7/19/2013
 *
 */

module mux16
  (output [15:0] out,
  input sel,
  input [15:0] a, b);
  
  mux
    m0(out[0], sel, a[0], b[0]),
    m1(out[1], sel, a[1], b[1]),
    m2(out[2], sel, a[2], b[2]),
    m3(out[3], sel, a[3], b[3]),
    m4(out[4], sel, a[4], b[4]),
    m5(out[5], sel, a[5], b[5]),
    m6(out[6], sel, a[6], b[6]),
    m7(out[7], sel, a[7], b[7]),
    m8(out[8], sel, a[8], b[8]),
    m9(out[9], sel, a[9], b[9]),
    m10(out[10], sel, a[10], b[10]),
    m11(out[11], sel, a[11], b[11]),
    m12(out[12], sel, a[12], b[12]),
    m13(out[13], sel, a[13], b[13]),
    m14(out[14], sel, a[14], b[14]),
    m15(out[15], sel, a[15], b[15]);
    
endmodule