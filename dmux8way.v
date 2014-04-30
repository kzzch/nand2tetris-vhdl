/**
 * 8-way demultiplexor.  
 * {a,b,c,d,e,f,g,h} = {in,0,0,0,0,0,0,0} if sel == 000
 *                     {0,in,0,0,0,0,0,0} if sel == 001
 *                     etc.
 *                     {0,0,0,0,0,0,0,in} if sel == 111
 */
 
module dmux8way(
  output a, b, c, d, e, f, g, h,
  input in, [2:0] sel);
  
  not
    not0(nots2, sel[2]);
  and
    and0(in0, nots2, in),
    and1(in1, sel[2], in);
    
  dmux4way
    dmux4way0(a, b, c, d, in0, sel[1:0]),
    dmux4way1(e, f, g, h, in1, sel[1:0]);
endmodule