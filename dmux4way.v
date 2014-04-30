/**
 * 4-way demultiplexor.  
 * {a,b,c,d} = {in,0,0,0} if sel == 00
 *             {0,in,0,0} if sel == 01
 *             {0,0,in,0} if sel == 10
 *             {0,0,0,in} if sel == 11
 */
 
module dmux4way(
  output a, b, c, d,
  input in,
  input [1:0] sel);
  
  not
    not0(nots1, sel[1]);
  and
    and0(in0, nots1, in),
    and1(in1, sel[1], in);
  
  dmux
    dmux0(a, b, in0, sel[0]),
    dmux1(c, d, in1, sel[0]);
    
endmodule