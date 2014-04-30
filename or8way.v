module or8way(
  output out,
  input [7:0] in);
  
  wire o1, o2, o3, o4, o5, o6;
  
  or
   or0(o1, in[0], in[1]),
   or1(o2, in[2], in[3]),
   or2(o3, in[4], in[5]),
   or3(o4, in[5], in[7]),
   or4(o5, o1, o2),
   or5(o6, o3, o4),
   or6(out, o5, o6);
   
endmodule
