module led (
  input sys_clk, // clk input
  input sys_rst_n, // reset input
  output reg [5:0] led // 6 LEDS pin
);

reg state;
reg [22:0] counter;
always @(posedge sys_clk)begin
  if(counter==4000000)begin
  counter<=0;
  end
  else begin
  counter<=counter+1;
  end
end

always @(posedge counter[21] or negedge sys_rst_n)begin
  if(~sys_rst_n)begin
  state<=0;
  led<=0;
  end
  else begin
    case(state)
      0:
      begin
      led<=led+1;
        if(led==62)begin
        state<=1;
        end
      end
      1:
      begin
      led<=led-1;
        if(led==1)begin
        state<=0;
        end
      end
    endcase
  end
end

endmodule
