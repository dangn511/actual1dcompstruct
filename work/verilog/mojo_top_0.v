/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg avr_rx,
    input avr_rx_busy,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input cclk,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input sum,
    input cout
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam BEGIN_state = 4'd0;
  localparam PREIDLE_state = 4'd1;
  localparam IDLE_state = 4'd2;
  localparam TESTCASE1_state = 4'd3;
  localparam TESTCASE2_state = 4'd4;
  localparam TESTCASE3_state = 4'd5;
  localparam TESTCASE4_state = 4'd6;
  localparam TESTCASE5_state = 4'd7;
  localparam TESTCASE6_state = 4'd8;
  localparam TESTCASE7_state = 4'd9;
  localparam TESTCASE8_state = 4'd10;
  localparam TESTCASE9_state = 4'd11;
  localparam TESTCASE10_state = 4'd12;
  localparam POSTPROC_state = 4'd13;
  localparam HALT1_state = 4'd14;
  localparam HALT2_state = 4'd15;
  
  reg [3:0] M_state_d, M_state_q = BEGIN_state;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_2 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_sc_inc_state1;
  wire [1-1:0] M_sc_inc_state2;
  wire [1-1:0] M_sc_inc_state3;
  stateCounter_3 sc (
    .clk(clk),
    .rst(rst),
    .inc_state1(M_sc_inc_state1),
    .inc_state2(M_sc_inc_state2),
    .inc_state3(M_sc_inc_state3)
  );
  reg [15:0] M_val_d, M_val_q = 1'h0;
  reg [3:0] M_digit1_d, M_digit1_q = 1'h0;
  reg [3:0] M_digit2_d, M_digit2_q = 1'h0;
  reg [15:0] M_scoref_d, M_scoref_q = 1'h0;
  reg [15:0] M_rngCounter_d, M_rngCounter_q = 1'h0;
  wire [16-1:0] M_rng_num;
  random_gen_4 rng (
    .clk(clk),
    .num(M_rng_num)
  );
  
  reg [15:0] a;
  
  reg [15:0] b;
  
  reg [0:0] myCounter;
  
  reg [5:0] alufn;
  
  reg [15:0] alu;
  
  wire [16-1:0] M_alumod_alu;
  wire [1-1:0] M_alumod_z;
  wire [1-1:0] M_alumod_v;
  wire [1-1:0] M_alumod_n;
  reg [6-1:0] M_alumod_alufn;
  reg [16-1:0] M_alumod_a;
  reg [16-1:0] M_alumod_b;
  alu_5 alumod (
    .alufn(M_alumod_alufn),
    .a(M_alumod_a),
    .b(M_alumod_b),
    .alu(M_alumod_alu),
    .z(M_alumod_z),
    .v(M_alumod_v),
    .n(M_alumod_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_val_d = M_val_q;
    M_scoref_d = M_scoref_q;
    M_rngCounter_d = M_rngCounter_q;
    M_digit2_d = M_digit2_q;
    M_digit1_d = M_digit1_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    led = {3'h0, io_button};
    spi_miso = 1'bz;
    io_seg = M_seg_seg;
    io_sel = ~M_seg_sel;
    a = 16'h0800;
    b = 1'h0;
    alufn = 1'h0;
    M_alumod_alufn = alufn;
    M_alumod_a = a;
    M_alumod_b = b;
    io_led[8+15-:16] = {{a[8+7-:8]}, {a[0+7-:8]}};
    M_seg_values = {4'h1, 4'h2, M_digit2_q, M_digit1_q};
    if (io_dip[0+0+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h0) begin
      myCounter = M_sc_inc_state1;
    end else begin
      if (io_dip[0+0+0-:1] == 1'h0 && io_dip[0+1+0-:1] == 1'h1) begin
        myCounter = M_sc_inc_state2;
      end else begin
        if (io_dip[0+0+0-:1] == 1'h1 && io_dip[0+1+0-:1] == 1'h1) begin
          myCounter = M_sc_inc_state3;
        end else begin
          myCounter = M_sc_inc_state2;
        end
      end
    end
    if (M_scoref_q == 16'h0000) begin
      M_digit1_d = 1'h0;
      M_digit2_d = 1'h0;
    end else begin
      if (M_scoref_q == 16'h0001) begin
        M_digit1_d = 1'h1;
        M_digit2_d = 1'h0;
      end else begin
        if (M_scoref_q == 16'h0002) begin
          M_digit1_d = 2'h2;
          M_digit2_d = 1'h0;
        end else begin
          if (M_scoref_q == 16'h0003) begin
            M_digit1_d = 2'h3;
            M_digit2_d = 1'h0;
          end else begin
            if (M_scoref_q == 16'h0004) begin
              M_digit1_d = 3'h4;
              M_digit2_d = 1'h0;
            end else begin
              if (M_scoref_q == 16'h0005) begin
                M_digit1_d = 3'h5;
                M_digit2_d = 1'h0;
              end else begin
                if (M_scoref_q == 16'h0006) begin
                  M_digit1_d = 3'h6;
                  M_digit2_d = 1'h0;
                end else begin
                  if (M_scoref_q == 16'h0007) begin
                    M_digit1_d = 3'h7;
                    M_digit2_d = 1'h0;
                  end else begin
                    if (M_scoref_q == 16'h0008) begin
                      M_digit1_d = 4'h8;
                      M_digit2_d = 1'h0;
                    end else begin
                      if (M_scoref_q == 16'h0009) begin
                        M_digit1_d = 4'h9;
                        M_digit2_d = 1'h0;
                      end else begin
                        if (M_scoref_q == 16'h000a) begin
                          M_digit1_d = 1'h0;
                          M_digit2_d = 1'h1;
                        end else begin
                          if (M_scoref_q == 16'h000b) begin
                            M_digit1_d = 1'h1;
                            M_digit2_d = 1'h1;
                          end else begin
                            if (M_scoref_q == 16'h000c) begin
                              M_digit1_d = 2'h2;
                              M_digit2_d = 1'h1;
                            end else begin
                              if (M_scoref_q == 16'h000d) begin
                                M_digit1_d = 2'h3;
                                M_digit2_d = 1'h1;
                              end else begin
                                if (M_scoref_q == 16'h000e) begin
                                  M_digit1_d = 3'h4;
                                  M_digit2_d = 1'h1;
                                end else begin
                                  if (M_scoref_q == 16'h000f) begin
                                    M_digit1_d = 3'h5;
                                    M_digit2_d = 1'h1;
                                  end else begin
                                    if (M_scoref_q == 16'h0010) begin
                                      M_digit1_d = 3'h6;
                                      M_digit2_d = 1'h1;
                                    end else begin
                                      if (M_scoref_q == 16'h0011) begin
                                        M_digit1_d = 3'h7;
                                        M_digit2_d = 1'h1;
                                      end else begin
                                        if (M_scoref_q == 16'h0012) begin
                                          M_digit1_d = 4'h8;
                                          M_digit2_d = 1'h1;
                                        end else begin
                                          if (M_scoref_q == 16'h0013) begin
                                            M_digit1_d = 4'h9;
                                            M_digit2_d = 1'h1;
                                          end else begin
                                            if (M_scoref_q == 16'h0014) begin
                                              M_digit1_d = 1'h0;
                                              M_digit2_d = 2'h2;
                                            end else begin
                                              if (M_scoref_q == 16'h0015) begin
                                                M_digit1_d = 1'h1;
                                                M_digit2_d = 2'h2;
                                              end else begin
                                                if (M_scoref_q == 16'h0016) begin
                                                  M_digit1_d = 2'h2;
                                                  M_digit2_d = 2'h2;
                                                end else begin
                                                  if (M_scoref_q == 16'h0017) begin
                                                    M_digit1_d = 2'h3;
                                                    M_digit2_d = 2'h2;
                                                  end else begin
                                                    if (M_scoref_q == 16'h0018) begin
                                                      M_digit1_d = 3'h4;
                                                      M_digit2_d = 2'h2;
                                                    end else begin
                                                      if (M_scoref_q == 16'h0019) begin
                                                        M_digit1_d = 3'h5;
                                                        M_digit2_d = 2'h2;
                                                      end else begin
                                                        if (M_scoref_q == 16'h001a) begin
                                                          M_digit1_d = 3'h6;
                                                          M_digit2_d = 2'h2;
                                                        end else begin
                                                          if (M_scoref_q == 16'h001b) begin
                                                            M_digit1_d = 3'h7;
                                                            M_digit2_d = 2'h2;
                                                          end else begin
                                                            if (M_scoref_q == 16'h001c) begin
                                                              M_digit1_d = 4'h8;
                                                              M_digit2_d = 2'h2;
                                                            end else begin
                                                              if (M_scoref_q == 16'h001d) begin
                                                                M_digit1_d = 4'h9;
                                                                M_digit2_d = 2'h2;
                                                              end else begin
                                                                if (M_scoref_q == 16'h001e) begin
                                                                  M_digit1_d = 1'h0;
                                                                  M_digit2_d = 2'h3;
                                                                end else begin
                                                                  if (M_scoref_q == 16'h001f) begin
                                                                    M_digit1_d = 1'h1;
                                                                    M_digit2_d = 2'h3;
                                                                  end else begin
                                                                    if (M_scoref_q == 16'h0020) begin
                                                                      M_digit1_d = 2'h2;
                                                                      M_digit2_d = 2'h3;
                                                                    end else begin
                                                                      if (M_scoref_q == 16'h0021) begin
                                                                        M_digit1_d = 2'h3;
                                                                        M_digit2_d = 2'h3;
                                                                      end else begin
                                                                        if (M_scoref_q == 16'h0022) begin
                                                                          M_digit1_d = 3'h4;
                                                                          M_digit2_d = 2'h3;
                                                                        end else begin
                                                                          if (M_scoref_q == 16'h0023) begin
                                                                            M_digit1_d = 3'h5;
                                                                            M_digit2_d = 2'h3;
                                                                          end else begin
                                                                            if (M_scoref_q == 16'h0024) begin
                                                                              M_digit1_d = 3'h6;
                                                                              M_digit2_d = 2'h3;
                                                                            end else begin
                                                                              if (M_scoref_q == 16'h0025) begin
                                                                                M_digit1_d = 3'h7;
                                                                                M_digit2_d = 2'h3;
                                                                              end else begin
                                                                                if (M_scoref_q == 16'h0026) begin
                                                                                  M_digit1_d = 4'h8;
                                                                                  M_digit2_d = 2'h3;
                                                                                end else begin
                                                                                  if (M_scoref_q == 16'h0027) begin
                                                                                    M_digit1_d = 4'h9;
                                                                                    M_digit2_d = 2'h3;
                                                                                  end else begin
                                                                                    if (M_scoref_q == 16'h0028) begin
                                                                                      M_digit1_d = 1'h0;
                                                                                      M_digit2_d = 3'h4;
                                                                                    end else begin
                                                                                      if (M_scoref_q == 16'h0029) begin
                                                                                        M_digit1_d = 1'h1;
                                                                                        M_digit2_d = 3'h4;
                                                                                      end else begin
                                                                                        if (M_scoref_q == 16'h002a) begin
                                                                                          M_digit1_d = 2'h2;
                                                                                          M_digit2_d = 3'h4;
                                                                                        end else begin
                                                                                          if (M_scoref_q == 16'h002b) begin
                                                                                            M_digit1_d = 2'h3;
                                                                                            M_digit2_d = 3'h4;
                                                                                          end else begin
                                                                                            if (M_scoref_q == 16'h002c) begin
                                                                                              M_digit1_d = 3'h4;
                                                                                              M_digit2_d = 3'h4;
                                                                                            end else begin
                                                                                              if (M_scoref_q == 16'h002d) begin
                                                                                                M_digit1_d = 3'h5;
                                                                                                M_digit2_d = 3'h4;
                                                                                              end else begin
                                                                                                if (M_scoref_q == 16'h002e) begin
                                                                                                  M_digit1_d = 3'h6;
                                                                                                  M_digit2_d = 3'h4;
                                                                                                end else begin
                                                                                                  if (M_scoref_q == 16'h002f) begin
                                                                                                    M_digit1_d = 3'h7;
                                                                                                    M_digit2_d = 3'h4;
                                                                                                  end else begin
                                                                                                    if (M_scoref_q == 16'h0030) begin
                                                                                                      M_digit1_d = 4'h8;
                                                                                                      M_digit2_d = 3'h4;
                                                                                                    end else begin
                                                                                                      if (M_scoref_q == 16'h0031) begin
                                                                                                        M_digit1_d = 4'h9;
                                                                                                        M_digit2_d = 3'h4;
                                                                                                      end else begin
                                                                                                        if (M_scoref_q == 16'h0032) begin
                                                                                                          M_digit1_d = 1'h0;
                                                                                                          M_digit2_d = 3'h5;
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    
    case (M_state_q)
      BEGIN_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = PREIDLE_state;
        end
      end
      PREIDLE_state: begin
        if (myCounter == 1'h1 && io_button[0+0-:1] == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      IDLE_state: begin
        a = 16'h1400;
        if (io_button[0+0-:1]) begin
          M_state_d = POSTPROC_state;
        end
        if (M_rng_num < 16'h0001) begin
          M_rngCounter_d = M_rngCounter_q + 1'h1;
          if (M_rngCounter_q == 12'hfa0) begin
            M_state_d = TESTCASE1_state;
          end else begin
            M_state_d = IDLE_state;
          end
        end
      end
      TESTCASE1_state: begin
        a = 16'h0001;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 4'ha;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE2_state;
          end
        end
        if (rst_n == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      TESTCASE2_state: begin
        a = 16'h0002;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 4'h9;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE3_state;
          end
        end
      end
      TESTCASE3_state: begin
        a = 16'h0004;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 4'h8;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE4_state;
          end
        end
      end
      TESTCASE4_state: begin
        a = 16'h0008;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 3'h7;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE5_state;
          end
        end
      end
      TESTCASE5_state: begin
        a = 16'h0010;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 3'h6;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE6_state;
          end
        end
      end
      TESTCASE6_state: begin
        a = 16'h0020;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 3'h5;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE7_state;
          end
        end
      end
      TESTCASE7_state: begin
        a = 16'h0040;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 3'h4;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE8_state;
          end
        end
      end
      TESTCASE8_state: begin
        a = 16'h0080;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 2'h3;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE9_state;
          end
        end
      end
      TESTCASE9_state: begin
        a = 16'h0100;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 2'h2;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = TESTCASE10_state;
          end
        end
      end
      TESTCASE10_state: begin
        a = 16'h0200;
        if (myCounter == 1'h1) begin
          if (io_button[0+0-:1]) begin
            M_alumod_alufn = 6'h00;
            M_alumod_a = M_scoref_q;
            M_alumod_b = 1'h1;
            M_scoref_d = M_alumod_alu;
            M_state_d = POSTPROC_state;
          end else begin
            M_state_d = POSTPROC_state;
          end
        end
      end
      POSTPROC_state: begin
        if (myCounter == 1'h1) begin
          M_val_d = M_val_q + 1'h1;
          M_alumod_alufn = 6'h33;
          M_alumod_a = M_val_q;
          M_alumod_b = 3'h4;
          if (M_alumod_alu) begin
            M_state_d = HALT1_state;
          end else begin
            M_rngCounter_d = 1'h0;
            M_state_d = PREIDLE_state;
          end
        end
      end
      HALT1_state: begin
        a = 16'h03ff;
        if (io_button[2+0-:1]) begin
          M_val_d = 1'h0;
          M_scoref_d = 1'h0;
          M_rngCounter_d = 1'h0;
          M_state_d = BEGIN_state;
        end
      end
    endcase
    io_led[8+15-:16] = {{a[8+7-:8]}, {a[0+7-:8]}};
    io_led[0+7-:8] = {M_val_q[0+7-:8]};
    M_seg_values = {M_digit1_q, M_digit2_q, 4'ha, 4'ha};
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_val_q <= 1'h0;
      M_digit1_q <= 1'h0;
      M_digit2_q <= 1'h0;
      M_scoref_q <= 1'h0;
      M_rngCounter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_val_q <= M_val_d;
      M_digit1_q <= M_digit1_d;
      M_digit2_q <= M_digit2_d;
      M_scoref_q <= M_scoref_d;
      M_rngCounter_q <= M_rngCounter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
