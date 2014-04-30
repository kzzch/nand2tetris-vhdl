/**
 * Contains the test modules for each of the individual
 * pieces of the Hack Computer from the and16 to the
 * CPU itself.
 */
 
module and16TestBench;
  wire [15:0] wOUT;
  wire [15:0] wAIN, wBIN;
  
  and16       d (wOUT, wAIN, wBIN);
  test_and16  t (wOUT, wAIN, wBIN);

endmodule

module test_and16
  (input signed [15:0] out,
  output reg signed [15:0] a, b);
  
  initial
    begin
      $monitor($time,,,
      "a = %b b = %b out = %b",
      a, b, out);
      
      #10 a = 16'b0; b = 16'b0;
      #10 b = 'b1111111111111111;
      #10 a = 'b1111111111111111;
      #10 a = 'b1010101010101010; b = 'b0101010101010101;
      #10 a = 'b0011110011000011; b = 'b0000111111110000;
      #10 a = 'b0001001000110100; b = 'b1001100001110110;
      #10 $stop;
    end      
endmodule

module add16TestBench;
  wire signed [15:0] sum, a, b;
    
  add16       d (sum, a, b);
  test_add16  t (sum, a, b);
endmodule

module test_add16
  (input signed [15:0] sum,
  output reg signed [15:0] a, b);
  
  initial
    begin
      $monitor($time,,,
      "a = %d b = %d sum = %d",
      a, b, sum);
      
      #10 a = 0; b = 0;
      #10 a = 'b1111_1111_1111_1111;
      #10 a = 'b1111_1111_1111_1111; b = 'b1111_1111_1111_1111;
      #10 a = 'b1010_1010_1010_1010; b = 'b0101_0101_0101_0101;
      #10 a = 'b0011_1100_1100_0011; b = 'b0000_1111_1111_0000;
      #10 a = 'b0001_0010_0011_0100; b = 'b1001_1000_0111_0110;
      #10
      #10 $stop;
        
    end
endmodule


module ALUTestBench;
  // Testbench
  wire wZR, wNG;
  wire [15:0] wOUT;
  wire wZX, wNX, wZY, wNY, wF, wNO;
  wire [15:0] wXIN, wYIN;
  
  ALU       d (wZR, wNG, wOUT, wZX, wNX, wZY, wNY, wF, wNO, wXIN, wYIN);
  test_ALU  t (wZR, wNG, wOUT, wZX, wNX, wZY, wNY, wF, wNO, wXIN, wYIN);
  
endmodule
  
module test_ALU
  (input zr, ng,
  input signed [15:0] out,
  
  output reg zx, nx, zy, ny, f, no, 
  output reg signed [15:0] x, y);
  
  initial
    begin
      $monitor($time,,,
        "x = %d y = %d out = %d zr = %b ng = %b zx: %b nx: %b zy: %b ny: %b f: %b no: %b",
        x, y, out, zr, ng, zx, nx, zy, ny, f, no);
        
      // waveform for simulating 
      #10 x = 0; y = 'b1111_1111_1111_1111;
      // Compute 0
      #10 zx = 1; nx = 0; zy = 1; ny = 0; f = 1; no = 0;
      // Compute 1
      #10 zx = 1; nx = 1; zy = 1; ny = 1; f = 1; no = 1;
      // Compute -1
      #10 zx = 1; nx = 1; zy = 1; ny = 0; f = 1; no = 0;
      // Compute x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 0;
      // Compute y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 0;
      // Compute ~x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 1;
      // Compute ~y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 1;
      // Compute -x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 1;
      // Compute -y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 1;
      // Compute x + 1
      #10 zx = 0; nx = 1; zy = 1; ny = 1; f = 1; no = 1;
      // Compute y + 1
      #10 zx = 1; nx = 1; zy = 0; ny = 1; f = 1; no = 1;
      // Compute x - 1
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 0;
      // Compute y - 1
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 0;
      // Compute x + y
      #10 zx = 0; nx = 0; zy = 0; ny = 0; f = 1; no = 0;
      // Compute x - y
      #10 zx = 0; nx = 1; zy = 0; ny = 0; f = 1; no = 1;
      // Compute y - x
      #10 zx = 0; nx = 0; zy = 0; ny = 1; f = 1; no = 1;
      // Compute x & y
      #10 zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0;
      // Compute x | y
      #10 zx = 0; nx = 1; zy = 0; ny = 1; f = 0; no = 1;
      
      #10
      #10 x = 16'b0; y = 16'b0;
      zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0;
      #10
      
      // x = 17, y = 3
      #10 x = 'b0000_0000_0001_0001; y = 'b0000_0000_0000_0011;
      // Compute 0
      #10 zx = 1; nx = 0; zy = 1; ny = 0; f = 1; no = 0;
      // Compute 1
      #10 zx = 1; nx = 1; zy = 1; ny = 1; f = 1; no = 1;
      // Compute -1
      #10 zx = 1; nx = 1; zy = 1; ny = 0; f = 1; no = 0;
      // Compute x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 0;
      // Compute y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 0;
      // Compute ~x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 0; no = 1;
      // Compute ~y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 0; no = 1;
      // Compute -x
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 1;
      // Compute -y
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 1;
      // Compute x + 1
      #10 zx = 0; nx = 1; zy = 1; ny = 1; f = 1; no = 1;
      // Compute y + 1
      #10 zx = 1; nx = 1; zy = 0; ny = 1; f = 1; no = 1;
      // Compute x - 1
      #10 zx = 0; nx = 0; zy = 1; ny = 1; f = 1; no = 0;
      // Compute y - 1
      #10 zx = 1; nx = 1; zy = 0; ny = 0; f = 1; no = 0;
      // Compute x + y
      #10 zx = 0; nx = 0; zy = 0; ny = 0; f = 1; no = 0;
      // Compute x - y
      #10 zx = 0; nx = 1; zy = 0; ny = 0; f = 1; no = 1;
      // Compute y - x
      #10 zx = 0; nx = 0; zy = 0; ny = 1; f = 1; no = 1;
      // Compute x & y
      #10 zx = 0; nx = 0; zy = 0; ny = 0; f = 0; no = 0;
      // Compute x | y
      #10 zx = 0; nx = 1; zy = 0; ny = 1; f = 0; no = 1;
      
            
      
      #10 $stop;
          
    end
endmodule

module test_dmux(
  input reg a, b,
  output reg in, sel);

  dmux    d (a, b, in, sel);
  
  initial
    begin
      $monitor($time,,,
      "in = %b sel = %b a = %b b = %b",
      in, sel, a, b);
      
      #10 in = 0; sel = 0;
      #10 sel = 1;
      #10 in = 1; sel = 0;
      #10 sel = 1;
      
    end
  endmodule  
  
module test_dmux4way(
  input reg a, b, c, d,
  output reg in, [1:0] sel);
  
  dmux4way  i (a, b, c, d, in, sel[1:0]);
 
  initial
    begin
      $monitor($time,,,
      "a = %b b = %b c = %b d = %b in = %b sel = %b",
      a, b, c, d, in, sel);
      
      #10 in = 0;
      #10 sel = 'b00;
      #10 sel = 'b01;
      #10 sel = 'b10;
      #10 sel = 'b11;
      #10 in = 1;
      #10 sel = 'b00;
      #10 sel = 'b01;
      #10 sel = 'b10;
      #10 sel = 'b11;
      
    end
  endmodule
  
module test_dmux8way(
  input reg a, b, c, d, e, f, g, h,
  output reg in, [2:0] sel);
  
  dmux8way i (a, b, c, d, e, f, g, h, in, sel[2:0]);
  
  initial
    begin
      $monitor($time,,,
      "a = %b b = %b c = %b d = %b e = %b f = %b g = %b h = %b in = %b sel = %b",
      a, b, c, d, e, f, g, h, in, sel);
      
      #10 in = 0; sel = 'b000;
      #10 sel = 'b001;
      #10 sel = 'b010;
      #10 sel = 'b011;
      #10 sel = 'b100;
      #10 sel = 'b101;
      #10 sel = 'b110;
      #10 sel = 'b111;

      #10 sel = 'b000;
      #10 in = 1;
      #10 sel = 'b001;
      #10 sel = 'b010;
      #10 sel = 'b011;
      #10 sel = 'b100;
      #10 sel = 'b101;
      #10 sel = 'b110;
      #10 sel = 'b111;
    end
  endmodule
  
module m555
  (output reg clock);
  
  initial
  #5 clock = 1;
  
  always
  #10 clock = ~clock;
endmodule
  
module test_register(
  input reg signed [15:0] out,
  output reg signed [15:0] in,
  output reg load);
  
  wire clock;
  
  register    r (out, in, load, clock);
  m555        clockGen (clock);
  
  initial
    begin
      $monitor($time,,,
      "in = %d out = %d load = %b clock = %b",
      in, out, load, clock);
      
      #0 in = 0; load = 0;
      #20 load = 1;
      #40 in = -32123; load = 0;
      #60 in = 11111;
      #80 in = -32123; load = 1;
      #100 load = 0;
      #120 in = 12345; load = 1;
      
      #140 load = 0; in = 0;
      #160 load = 1;
      #180 in = 0;
      $stop;
    end
  
endmodule