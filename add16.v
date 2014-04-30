/**
 * 16-bit ripple carry adder
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 * Adapted by Jeremiah Biard
 * 7/19/2013
 *
 */
 
module add16(
  output signed [15:0] sum,
  input signed [15:0] a, b);
  
  wire foo = 0;
  wire [15:0] c;
  
  fullAdder
    fa0(sum[0], c[0], a[0], b[0], foo),
    fa1(sum[1], c[1], a[1], b[1], c[0]),
    fa2(sum[2], c[2], a[2], b[2], c[1]),
    fa3(sum[3], c[3], a[3], b[3], c[2]),
    fa4(sum[4], c[4], a[4], b[4], c[3]),
    fa5(sum[5], c[5], a[5], b[5], c[4]),
    fa6(sum[6], c[6], a[6], b[6], c[5]),
    fa7(sum[7], c[7], a[7], b[7], c[6]),
    fa8(sum[8], c[8], a[8], b[8], c[7]),
    fa9(sum[9], c[9], a[9], b[9], c[8]),
    fa10(sum[10], c[10], a[10], b[10], c[9]),
    fa11(sum[11], c[11], a[11], b[11], c[10]),
    fa12(sum[12], c[12], a[12], b[12], c[11]),
    fa13(sum[13], c[13], a[13], b[13], c[12]),
    fa14(sum[14], c[14], a[14], b[14], c[13]),
    fa15(sum[15], c[15], a[15], b[15], c[14]);
  
endmodule
