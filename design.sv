// Code your design here
module cordic(
			clk,
            reset,
           operands_val,
            x_start,
            y_start,
            angle,
            sine,
            cosine
           //out_valid
            
);
  
  parameter width =16;
  
  //inputs
  input clk,reset,operands_val;
  input signed [width-1:0] x_start,y_start;
  input signed [width-1:0]angle;
  //outputs
  output reg signed [width-1:0] sine,cosine;
  //output reg out_valid;
 
  //registers
  reg signed [width-1:0] x0;
  reg signed [width-1:0] y0;
  reg signed [width-1:0] theta0;
  /////////////////////
  reg signed [width-1:0] x1;
  reg signed [width-1:0] y1;
  reg signed [width-1:0] theta1;
  /////////////////////
  reg signed [width-1:0] x2;
  reg signed [width-1:0] y2;
  reg signed [width-1:0] theta2;
  /////////////////////
  reg signed [width-1:0] x3;
  reg signed [width-1:0] y3;
  reg signed [width-1:0] theta3;
  /////////////////////
  reg signed [width-1:0] x4;
  reg signed [width-1:0] y4;
  reg signed [width-1:0] theta4;
  /////////////////////
  reg signed [width-1:0] x5;
  reg signed [width-1:0] y5;
  reg signed [width-1:0] theta5;
  /////////////////////
  reg signed [width-1:0] x6;
  reg signed [width-1:0] y6;
  reg signed [width-1:0] theta6;
  /////////////////////
  reg signed [width-1:0] x7;
  reg signed [width-1:0] y7;
  reg signed [width-1:0] theta7;
  /////////////////////
  reg signed [width-1:0] x8;
  reg signed [width-1:0] y8;
  reg signed [width-1:0] theta8;
  /////////////////////
  reg signed [width-1:0] x9;
  reg signed [width-1:0] y9;
  reg signed [width-1:0] theta9;
  /////////////////////
  reg signed [width-1:0] x10;
  reg signed [width-1:0] y10;
  reg signed [width-1:0] theta10;
  /////////////////////
  reg signed [width-1:0] x11;
  reg signed [width-1:0] y11;
  reg signed [width-1:0] theta11;
  /////////////////////
  reg signed [width-1:0] x12;
  reg signed [width-1:0] y12;
  reg signed [width-1:0] theta12;
  /////////////////////
  reg signed [width-1:0] x13;
  reg signed [width-1:0] y13;
  reg signed [width-1:0] theta13;
  /////////////////////
  reg signed [width-1:0] x14;
  reg signed [width-1:0] y14;
  reg signed [width-1:0] theta14;
  /////////////////////
  reg signed [width-1:0] x15;
  reg signed [width-1:0] y15;
  reg signed [width-1:0] theta15;
  /////////////////////
///////////////////////
  wire signed [width-1:0] x_add_out0,y_add_out0,theta_add_out0;
  
  reg signed[width-1:0] x_add_out1,y_add_out1,theta_add_out1,
                        x_add_out2,y_add_out2,theta_add_out2,
                          x_add_out3,y_add_out3,theta_add_out3,
                        x_add_out4,y_add_out4,theta_add_out4,
                          x_add_out5,y_add_out5,theta_add_out5,
                        x_add_out6,y_add_out6,theta_add_out6,
                          x_add_out7,y_add_out7,theta_add_out7,
                        x_add_out8,y_add_out8,theta_add_out8,
                          x_add_out9,y_add_out9,theta_add_out9,
                        x_add_out10,y_add_out10,theta_add_out10,
                          x_add_out11,y_add_out11,theta_add_out11,
                        x_add_out12,y_add_out12,theta_add_out12, 
                          x_add_out13,y_add_out13,theta_add_out13,
                        x_add_out14,y_add_out14,theta_add_out14,
                          x_add_out15,y_add_out15,theta_add_out15;
                  
	parameter [15:0] del0 = 16'b0011001001000100;
    parameter [15:0] del1 = 16'b0001110110101100;
    parameter [15:0] del2 = 16'b0000111110101101;
    parameter [15:0] del3 = 16'b0000011111110101;
    parameter [15:0] del4 = 16'b0000001111111110;
    parameter [15:0] del5 = 16'b0000001000000000;
    parameter [15:0] del6 = 16'b0000000100000000;
    parameter [15:0] del7 = 16'b0000000010000000;
    parameter [15:0] del8 = 16'b0000000001000000;
    parameter [15:0] del9 = 16'b0000000000100000;
    parameter [15:0] del10 =16'b0000000000010000;
    parameter [15:0] del11 =16'b0000000000001000;
    parameter [15:0] del12 =16'b0000000000000100;
    parameter [15:0] del13= 16'b0000000000000010;
    parameter [15:0] del14= 16'b0000000000000001;
    parameter [15:0] del15= 16'b0000000000000000;
assign x_add_out0=x0-y0;
assign y_add_out0=x0+y0;
assign theta_add_out0=theta0-del0;
  assign cosine=x_add_out15;
  assign sine=y_add_out15;
  
  always@(posedge clk)
    begin 
      if(reset)
        begin
          x0<=0;
          y0<=0;
          theta0<=0;
          x1<=0;
          y1<=0;
          theta1<=0;
          x2<=0;
          y2<=0;
          theta2<=0;
          x3<=0;
          y3<=0;
          theta3<=0;
          x4<=0;
          y4<=0;
          theta4<=0;
          x5<=0;
          y5<=0;
          theta5<=0;
          x6<=0;
          y6<=0;
          theta6<=0;
          x7<=0;
          y7<=0;
          theta7<=0;
          x8<=0;
          y8<=0;
          theta8<=0;
          x9<=0;
          y9<=0;
          theta9<=0;
          x10<=0;
          y10<=0;
          theta10<=0;
          x11<=0;
          y11<=0;
          theta11<=0;
          x12<=0;
          y12<=0;
          theta12<=0;
          x13<=0;
          y13<=0;
          theta13<=0;
           x14<=0;
          y14<=0;
          theta14<=0;
            x15<=0;
          y15<=0;
          theta15<=0;
        end
      else
        begin
      x0<=x_start;
      y0<=y_start;
      theta0<=angle;
 ////////////////
       x1<=x_add_out0;
      y1<=y_add_out0;
      theta1<=theta_add_out0;
 ////////////////
         x2<=x_add_out1;
      y2<=y_add_out1;
      theta2<=theta_add_out1;
 ////////////////
       x3<=x_add_out2;
      y3<=y_add_out2;
      theta3<=theta_add_out2;
 ////////////////
       x4<=x_add_out3;
      y4<=y_add_out3;
      theta4<=theta_add_out3;
 ////////////////
        x5<=x_add_out4;
      y5<=y_add_out4;
      theta5<=theta_add_out4;
 ////////////////
        x6<=x_add_out5;
      y6<=y_add_out5;
      theta6<=theta_add_out5;
 ////////////////
         x7<=x_add_out6;
      y7<=y_add_out6;
      theta7<=theta_add_out6;
 ////////////////
         x8<=x_add_out7;
      y8<=y_add_out7;
      theta8<=theta_add_out7;
 ////////////////
         x9<=x_add_out8;
      y9<=y_add_out8;
      theta9<=theta_add_out8;
 //////////////// 
      x10<=x_add_out9;
      y10<=y_add_out9;
      theta10<=theta_add_out9;
 ////////////////
       x11<=x_add_out10;
      y11<=y_add_out10;
      theta11<=theta_add_out10;
 //////////////// 
      x12<=x_add_out11;
      y12<=y_add_out11;
      theta12<=theta_add_out11;
 ////////////////
       x13<=x_add_out12;
      y13<=y_add_out12;
      theta13<=theta_add_out12;
 ////////////////
          x14<=x_add_out13;
      y14<=y_add_out13;
      theta14<=theta_add_out13;
 ////////////////
          x15<=x_add_out14;
      y15<=y_add_out14;
      theta15<=theta_add_out14;
 ////////////////
        end
    end
  

  
  always@(*)
  	begin
  case(theta1[15])
    1'b1:
    begin
      x_add_out1=x1+(y1>>>1);
      y_add_out1=y1-(x1>>>1);
 	  theta_add_out1=theta1+del1; 
    end
    1'b0:
      begin
        x_add_out1=x1-(y1>>>1);
        y_add_out1=y1+(x1>>>1);
 		 theta_add_out1=theta1-del1;
      end
  endcase
      
/////////////////////////////      
      case(theta2[15])
    1'b1:
    begin
      x_add_out2=x2+(y2>>>2);
      y_add_out2=y2-(x2>>>2);
 		theta_add_out2=theta2+del2; 
    end
    1'b0:
      begin
        x_add_out2=x2-(y2>>>2);
        y_add_out2=y2+(x2>>>2);
 		 theta_add_out2=theta2-del2;
      end
  endcase
      
    /////////////////////////////      
      case(theta3[15])
    1'b1:
    begin
      x_add_out3=x3+(y3>>>3);
      y_add_out3=y3-(x3>>>3);
 		theta_add_out3=theta3+del3; 
    end
    1'b0:
      begin
        x_add_out3=x3-(y3>>>3);
        y_add_out3=y3+(x3>>>3);
 		 theta_add_out3=theta3-del3;
      end
  endcase
      /////////////////////////////      
      case(theta4[15])
    1'b1:
    begin
      x_add_out4=x4+(y4>>>4);
      y_add_out4=y4-(x4>>>4);
 		theta_add_out4=theta4+del4; 
    end
    1'b0:
      begin
        x_add_out4=x4-(y4>>>4);
        y_add_out4=y4+(x4>>>4);
 		 theta_add_out4=theta4-del4;
      end
  endcase
      /////////////////////////////      
      case(theta5[15])
    1'b1:
    begin
      x_add_out5=x5+(y5>>>5);
      y_add_out5=y5-(x5>>>5);
 		theta_add_out5=theta5+del5; 
    end
    1'b0:
      begin
        x_add_out5=x5-(y5>>>5);
        y_add_out5=y5+(x5>>>5);
 		 theta_add_out5=theta5-del5;
      end
  endcase
      /////////////////////////////      
      case(theta6[15])
    1'b1:
    begin
      x_add_out6=x6+(y6>>>6);
      y_add_out6=y6-(x6>>>6);
 		theta_add_out6=theta6+del6; 
    end
    1'b0:
      begin
        x_add_out6=x6-(y6>>>6);
        y_add_out6=y6+(x6>>>6);
 		 theta_add_out6=theta6-del6;
      end
  endcase
      /////////////////////////////      
      case(theta7[15])
    1'b1:
    begin
      x_add_out7=x7+(y7>>>7);
      y_add_out7=y7-(x7>>>7);
 		theta_add_out7=theta7+del7; 
    end
    1'b0:
      begin
        x_add_out7=x7-(y7>>>7);
        y_add_out7=y7+(x7>>>7);
 		 theta_add_out7=theta7-del7;
      end
  endcase
      /////////////////////////////      
      case(theta8[15])
    1'b1:
    begin
      x_add_out8=x8+(y8>>>8);
      y_add_out8=y8-(x8>>>8);
 		theta_add_out8=theta8+del8; 
    end
    1'b0:
      begin
        x_add_out8=x8-(y8>>>8);
        y_add_out8=y8+(x8>>>8);
 		 theta_add_out8=theta8-del8;
      end
  endcase
      /////////////////////////////      
      case(theta9[15])
    1'b1:
    begin
      x_add_out9=x9+(y9>>>9);
      y_add_out9=y9-(x9>>>9);
 		theta_add_out9=theta9+del9; 
    end
    1'b0:
      begin
        x_add_out9=x9-(y9>>>9);
        y_add_out9=y9+(x9>>>9);
 		 theta_add_out9=theta9-del9;
      end
  endcase
        /////////////////////////////      
      case(theta10[15])
    1'b1:
    begin
      x_add_out10=x10+(y10>>>10);
      y_add_out10=y10-(x10>>>10);
 		theta_add_out10=theta10+del10; 
    end
    1'b0:
      begin
        x_add_out10=x10-(y10>>>10);
        y_add_out10=y10+(x10>>>10);
 		 theta_add_out10=theta10-del10;
      end
  endcase  
       /////////////////////////////      
      case(theta11[15])
    1'b1:
    begin
      x_add_out11=x11+(y11>>>11);
      y_add_out11=y11-(x11>>>11);
 		theta_add_out11=theta11+del11; 
    end
    1'b0:
      begin
        x_add_out11=x11-(y11>>>11);
        y_add_out11=y11+(x11>>>11);
 		 theta_add_out11=theta11-del11;
      end
  endcase 
      /////////////////////////////      
      case(theta12[15])
    1'b1:
    begin
      x_add_out12=x12+(y12>>>12);
      y_add_out12=y12-(x12>>>12);
 		theta_add_out12=theta12+del12; 
    end
    1'b0:
      begin
        x_add_out12=x12-(y12>>>12);
        y_add_out12=y12+(x12>>>12);
 		 theta_add_out12=theta12-del12;
      end
  endcase 
        /////////////////////////////      
      case(theta13[15])
    1'b1:
    begin
      x_add_out13=x13+(y13>>>13);
      y_add_out13=y13-(x13>>>13);
 		theta_add_out13=theta13+del13; 
    end
    1'b0:
      begin
        x_add_out13=x13-(y13>>>13);
        y_add_out13=y13+(x13>>>13);
 		 theta_add_out13=theta13-del13;
      end
  endcase 
        /////////////////////////////      
      case(theta14[15])
    1'b1:
    begin
      x_add_out14=x14+(y14>>>14);
      y_add_out14=y14-(x14>>>14);
 		theta_add_out14=theta14+del14; 
    end
    1'b0:
      begin
        x_add_out14=x14-(y14>>>14);
        y_add_out14=y14+(x14>>>14);
 		 theta_add_out14=theta14-del14;
      end
  endcase 
        /////////////////////////////      
      case(theta15[15])
    1'b1:
    begin
      x_add_out15=x15+(y15>>>15);
      y_add_out15=y15-(x15>>>15);
 		theta_add_out15=theta15+del15; 
    end
    1'b0:
      begin
        x_add_out15=x15-(y15>>>15);
        y_add_out15=y15+(x15>>>15);
 		 theta_add_out15=theta15-del15;
      end
  endcase 
        /////////////////////////////      
      //assign out_valid=(theta_add_out==16'hffff || theta_add_out==0);    
  end
endmodule

  
