
module tb;
  parameter width =16;
  reg clk;
  reg reset;
  reg operands_val;
  reg signed [width-1:0] x_start,y_start;
  reg signed [width-1:0]angle;
  wire signed [width-1:0] sine,cosine;
  //wire out_valid;
  reg signed [width-1:0]angle_data[0:9];
  cordic cordic(.clk(clk),.reset(reset),.operands_val(operands_val),.x_start(x_start),.y_start(y_start),.angle(angle),.sine(sine),.cosine(cosine));
  
  integer i;
  //integer writedata;
  localparam SF=2.0**-14;
  always #5clk=~clk;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end
  
  initial
    begin
      drive_reset();
      //write_data=$fopen("output_tracker.txt","w");
      //$fclose(write_data);
      $readmemh("angle_hex.txt",angle_data);
      for(i=0;i<10;i=i+1)
        begin
          drive_input(angle_data[i]);
          check_output();
        end
       
      for(i=0;i<20;i=i+1)
        begin
          check_output();
        end
    $finish;
    end
   
  task drive_reset();
    $display("Driving the reset");
    clk = 1'b0;
    @(negedge clk)
    reset = 0;
    @(negedge clk)
    reset = 1;
    @(negedge clk)
    reset = 1;
    @(negedge clk)
    reset = 0;
  endtask 
  
  task drive_input(input [width-1:0] angle_gen);
    @(negedge clk)  
      //$display("Driving the Input");
        operands_val= 1;
    	x_start=16'h26dd;
    	y_start=0;
    	angle=angle_gen;
     @(negedge clk)
        operands_val= 0;
  endtask
  
  task check_output();
    @(posedge clk)
   //$display("Recieved output Valid");
    $display("Cosine  = %f, Sine  = %f",  $itor(cosine * SF),  $itor(sine * SF)); 
    //$display("expected cosine=%f, expected sine=%f",$itor($cos(angle)),$itor($sin(angle)));
    
  endtask
endmodule
