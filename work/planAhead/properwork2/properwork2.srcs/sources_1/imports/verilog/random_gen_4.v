/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SEED = 128h843233523a613966423b622562592c62
*/
module random_gen_4 (
    input clk,
    output reg [15:0] num
  );
  
  localparam SEED = 128'h843233523a613966423b622562592c62;
  
  
  reg [31:0] M_x_d, M_x_q = 1'h0;
  reg [31:0] M_y_d, M_y_q = 1'h0;
  reg [31:0] M_z_d, M_z_q = 1'h0;
  reg [31:0] M_w_d, M_w_q = 1'h0;
  reg M_initd_d, M_initd_q = 1'h0;
  
  reg [31:0] t;
  
  always @* begin
    M_w_d = M_w_q;
    M_initd_d = M_initd_q;
    M_z_d = M_z_q;
    M_y_d = M_y_q;
    M_x_d = M_x_q;
    
    num = M_w_q[0+15-:16];
    t = M_x_q ^ (M_x_q << 4'hb);
    M_x_d = M_y_q;
    M_y_d = M_z_q;
    M_z_d = M_w_q;
    M_w_d = M_w_q ^ (M_w_q >> 5'h13) ^ t ^ (t >> 4'h8);
    if (!M_initd_q) begin
      M_x_d = 32'h62592c62;
      M_y_d = 32'h423b6225;
      M_z_d = 32'h3a613966;
      M_w_d = 32'h84323352;
      M_initd_d = 1'h1;
    end
  end
  
  always @(posedge clk) begin
    M_x_q <= M_x_d;
    M_y_q <= M_y_d;
    M_z_q <= M_z_d;
    M_w_q <= M_w_d;
    M_initd_q <= M_initd_d;
  end
  
endmodule
