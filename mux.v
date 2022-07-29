`define dly_and 1
`define dly_or 2

module mux (out,a,b,sel);

// Port declarations
  output out;
  input a,b,sel;
  wire clk;
// The netlist
  not  u1(sel_, sel);
  and #`dly_and u2(a1, a, sel_); 
  and #`dly_and u3(b1, b, sel);
  or #`dly_or u4(out, a1, b1);
  
  
//debugware
OSC m0(.clk (clk));

debugware_v2_1 m1(
    .trig_in_0(out),
    .data_in_0(4'b0),
    .ref_clk_0(clk),
    .trig_in_1(out),
    .data_in_1(4'b0),
    .ref_clk_1(clk)
);

initial
begin
  // ** Add stimulus here **
  	#10 a = 0; b = 0; sel = 0;
	#10 begin a = 1; b = 0; sel = 1;  end
	#10 begin a = 1; b = 1; sel = 0; end
	#10 begin a = 0; b = 1; sel = 1;end
	#10 begin a = 0; b = 1; sel = 0;end
	#10 begin a = 1; b = 0; sel = 0;end
	#10 begin a = 0; b = 0; sel = 1;end
	#10 begin a = 1; b = 1; sel = 1;end
  	#20 $finish;
  // ** Add stimulus here **
end

/*
input [7:0] trig_in_0;
input [3:0] data_in_0;
input ref_clk_0;
input trig_in_1;
input [3:0] data_in_1;
input ref_clk_1;
*/




endmodule