module or16(
  output [15:0] out,
  input [15:0] a, b);
  
  or
    or0(out[0], a[0], b[0]),
    or1(out[1], a[1], b[1]),
    or2(out[2], a[2], b[2]),
    or3(out[3], a[3], b[3]),
    or4(out[4], a[4], b[4]),
    or5(out[5], a[5], b[5]),
    or6(out[6], a[6], b[6]),
    or7(out[7], a[7], b[7]),
    or8(out[8], a[8], b[8]),
    or9(out[9], a[9], b[9]),
    or10(out[10], a[10], b[10]),
    or11(out[11], a[11], b[11]),
    or12(out[12], a[12], b[12]),
    or13(out[13], a[13], b[13]),
    or14(out[14], a[14], b[14]),
    or15(out[15], a[15], b[15]);
    
endmodule
