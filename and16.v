/**
 * 16-bit-wise And gate: for i = 0..15: out[i] = a[i] And b[i]
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 * Adapted by Jeremiah Biard
 * 7/19/2013
 *
 */

module and16
  (output [15:0] out,
  input [15:0] a, b);
  
  and
    a0(out[0], a[0], b[0]),
    a1(out[1], a[1], b[1]),
    a2(out[2], a[2], b[2]),
    a3(out[3], a[3], b[3]),
    a4(out[4], a[4], b[4]),
    a5(out[5], a[5], b[5]),
    a6(out[6], a[6], b[6]),
    a7(out[7], a[7], b[7]),
    a8(out[8], a[8], b[8]),
    a9(out[9], a[9], b[9]),
    a10(out[10], a[10], b[10]),
    a11(out[11], a[11], b[11]),
    a12(out[12], a[12], b[12]),
    a13(out[13], a[13], b[13]),
    a14(out[14], a[14], b[14]),
    a15(out[15], a[15], b[15]);
    
endmodule