`include "code.v"
`timescale 1ps/1ps

module code_tb;
  // Signals
  reg clk;
  reg reset;
  reg ld_morn, ld_mid, ld_night;
  reg [6:0] data_in_morn, data_in_mid, data_in_night;
  wire med_0, med_1, med_2, med_3;

  // Instantiate the mainCounter module
  mainCounter uut (
    clk,
    reset,
    ld_morn,
    data_in_morn,
    ld_mid,
    data_in_mid,
    ld_night,
    data_in_night,
    med_0,
    med_1,
    med_2,
    med_3
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #1000000 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    $dumpvars(0, code_tb);
    reset = 1'b1;
    ld_morn = 1'b0;
    data_in_morn = 7'b0000000;
    ld_mid = 1'b0;
    data_in_mid = 7'b0000000;
    ld_night = 1'b0;
    data_in_night = 7'b0000000;

    // Apply some test scenarios
    $display("clk, reset, ld_morn, [6:0] data_in_morn, ld_mid, [6:0] data_in_mid, ld_night, [6:0] data_in_night, med_0, med_1, med_2, med_3");
    $monitor("%b     %b      %b       %b              %b           %b        %b        %b                %b    %b       %b        %b  ", clk, reset, ld_morn, data_in_morn, ld_mid, data_in_mid, ld_night, data_in_night, med_0, med_1, med_2, med_3);    
    #20 ld_morn = 1'b1;
    data_in_morn = 7'b0000100;

    
    #10 ld_mid = 1'b1;
    data_in_mid = 7'b1001000;


    #10 ld_night = 1'b1;
    data_in_night = 7'b1110000;

    

    #100 $finish;
  end

endmodule

    
        