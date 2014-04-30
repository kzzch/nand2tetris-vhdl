/**
  The ALU. Computes one of the following functions:
  x + y, x - y, y - x, 0, 1, -1, x, y, -x, -y, !x, !y,
  x + 1, y + 1, x - 1, y - 1, x & y, x | y on two 16-bit
  inputs.
  
  Which function to compute is determined by 6 input bits
  denoted zx, nx, zy, ny, f, and no.
  
  The computed function's value is called "out".
  
  In addition to computing out, the ALU computes two
  1-bit outputs called zr and ng:
  
  if out == 0, zr = 1; otherwize zr = 0;
  if out < 0, ng = 1; otherwise ng = 0
  
  The 6-bit combinations (xz, nx, zy, ny, f, no) and
  their effect are documented in the book.

   Wires:
   
   ouput reg out,
   out = ~currentState[1] & currentState[0];
   
   x0, x1, x2
   y0, y1, y2
   notx, noty
   xandy, xplusy
   nout, out1
   
   Inputs:
      Vector:
        reg [15:0] x, y;
      Scalar:
        zx, nx, zy, ny, f, no
  
    Outputs:
      Vector:
        reg [15:0] out;
      Scalar:
        zr  // 1 if (out == 0), 0 otherwise
        ng  // 1 if (out < 0), 0 otherwise
*/
  
module ALU 
  (output zr, ng, 
  output [15:0] out,
  
  input zx, nx, zy, ny, f, no,
  input [15:0] x, y);
  
  wire [15:0] x0, y0, x1, y1, x2, y2, xandy, xplusy, notx, noty, nout, out1;
  
  // if (zx == 1) sets x = 0
  and16
    a0(x0, x, 16'b0);
  mux16
    mux0(x1, zx, x, x0);
  
  // if (nx == 1) sets x = ~x
  not16
    n16_0(notx, x1);
  mux16
    mux1(x2, nx, x1, notx);
  
  // if (zy == 1) sets y = 0
  and16
    a1(y0, y, 16'b0);
  mux16
    mux2(y1, zy, y, y0);
  
  // if (ny == 1) sets y = ~y
  not16
    n16_1(noty, y1);
  mux16
    mux3(y2, ny, y1, noty);
  
  // if (f == 1) sets out = x + y
  // if (f == 0) sets out = x & y
  add16
    add16_0(xplusy, x2, y2);
  and16
    a2(xandy, x2, y2);
  mux16
    mux4(out1, f, xandy, xplusy);
  
  // if (no == 1) sets out = ~out
  not16
    n16_2(nout, out1);
  mux16
    mux5(out, no, out1, nout);
  
  // if (out == 0) sets zr = 1
  or8way
    o80(or1, out[7:0]),
    o81(or2, out[15:8]);
  or(or3, or1, or2);
  nand(zr, or3, 'b1);
  
  // if (out < 0) setx ng = 1
  and(ng, out[15], 'b1);
  
  
  
  /*
  and
    a3(ng, out[15], 'b1);    
  and16
    a16_0(x0[15:0], x[15:0], 16'b0),  // zero x
    a16_1(y0[15:0], y[15:0], 16'b0),
    a16_2(xandy[15:0], x2[15:0], y2[15:0]);
    
  not16
    n0(notx[15:0], x1[15:0]),
    n1(noty[15:0], y1[15:0]),
    n2(nout[15:0], out1[15:0]);
    
  nand
    na0(zr, zero, 'b1);
  
  add16
    add0(xplusy[15:0], x2[15:0], y2[15:0]);
    
  mux16
    mx0(x1[15:0], zx, x[15:0], x0[15:0]),             // Zero X?
    mx1(y1[15:0], zy, y[15:0], y0[15:0]),             // Zero Y?
    mx2(x2[15:0], nx, x1[15:0], notx[15:0]),          // Negate X?
    mx3(y2[15:0], ny, y1[15:0], noty[15:0]),          // Negate Y?
    mx4(out1[15:0], f, xandy[15:0], xplusy[15:0]),    // X + Y | X & Y
    mx5(out[15:0], no, out1[15:0], nout[15:0]);       // Negate the output?
  */
    
endmodule