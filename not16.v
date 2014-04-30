/**
 * 16-bit Not gate: for i = 0..15: out[i] = Not in[i]
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 * Adapted by Jeremiah Biard
 * 7/19/2013
 *
 */
 
module not16(
  output [15:0] out,
  input [15:0] in);
  
  not
    n0(out[0], in[0]),
    n1(out[1], in[1]),
    n2(out[2], in[2]),
    n3(out[3], in[3]),
    n4(out[4], in[4]),
    n5(out[5], in[5]),
    n6(out[6], in[6]),
    n7(out[7], in[7]),
    n8(out[8], in[8]),
    n9(out[9], in[9]),
    n10(out[10], in[10]),
    n11(out[11], in[11]),
    n12(out[12], in[12]),
    n13(out[13], in[13]),
    n14(out[14], in[14]),
    n15(out[15], in[15]);
    
endmodule