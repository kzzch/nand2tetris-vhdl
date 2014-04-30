
/**
 * 16-bit incrementer. out = in + 1 (16-bit addition).
 * Overflow is neiter detected nor handled.
 *
 * Adapted from "The Elements of Computer Systems"
 * by Nisan and Schocken, MIT Press.
 *
 * Adapted by Jeremiah Biard
 * 7/19/2013
 *
 */
 
 module inc16(
   output [15:0] out,
   input [15:0] in);
   
   add16(out[15:0], in[15:0], 16'b1);
 endmodule