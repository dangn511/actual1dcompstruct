/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 4
     TIME = 18
*/
module multi_seven_seg_2 (
    input clk,
    input rst,
    input [15:0] values,
    output reg [6:0] seg,
    output reg [3:0] sel
  );
  
  localparam DIGITS = 3'h4;
  localparam TIME = 5'h12;
  
  
  wire [7-1:0] M_seg_dec_segs;
  reg [4-1:0] M_seg_dec_char;
  seven_seg_6 seg_dec (
    .char(M_seg_dec_char),
    .segs(M_seg_dec_segs)
  );
  
  wire [4-1:0] M_decode_out;
  reg [2-1:0] M_decode_in;
  decoder_7 decode (
    .in(M_decode_in),
    .out(M_decode_out)
  );
  
  wire [18-1:0] M_c_value;
  counter_8 c (
    .clk(clk),
    .rst(rst),
    .value(M_c_value)
  );
  reg [1:0] M_sel_val_d, M_sel_val_q = 1'h0;
  reg [3:0] M_sel_out_d, M_sel_out_q = 1'h0;
  
  always @* begin
    M_sel_out_d = M_sel_out_q;
    M_sel_val_d = M_sel_val_q;
    
    M_seg_dec_char = values[(M_sel_val_q)*4+3-:4];
    seg = M_seg_dec_segs;
    M_decode_in = M_sel_val_q;
    M_sel_out_d = M_decode_out;
    sel = M_sel_out_q;
    if ((&M_c_value)) begin
      if (M_sel_val_q == 3'h4) begin
        M_sel_val_d = 1'h0;
      end else begin
        M_sel_val_d = M_sel_val_q + 1'h1;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_sel_val_q <= 1'h0;
      M_sel_out_q <= 1'h0;
    end else begin
      M_sel_val_q <= M_sel_val_d;
      M_sel_out_q <= M_sel_out_d;
    end
  end
  
endmodule
