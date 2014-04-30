module register(
  output [15:0] out,
  input [15:0] in,
  input load, clock);
  
  bit
    bit0(out[0], in[0], load, clock),
    bit1(out[1], in[1], load, clock),
    bit2(out[2], in[2], load, clock),
    bit3(out[3], in[3], load, clock),
    bit4(out[4], in[4], load, clock),
    bit5(out[5], in[5], load, clock),
    bit6(out[6], in[6], load, clock),
    bit7(out[7], in[7], load, clock),
    bit8(out[8], in[8], load, clock),
    bit9(out[9], in[9], load, clock),
    bit10(out[10], in[10], load, clock),
    bit11(out[11], in[11], load, clock),
    bit12(out[12], in[12], load, clock),
    bit13(out[13], in[13], load, clock),
    bit14(out[14], in[14], load, clock),
    bit15(out[15], in[15], load, clock);
    
  endmodule
  
