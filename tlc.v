`timescale 1ns / 1ps
module tlc(
    input on,clk,
    output r,g,y
    );
    
    reg tempr=0,tempy=0,tempg=0;
    
    integer count;//for how much time one led glow is decided by count variable
    
    reg [1:0]state=0;//00 01 10 11 and we have started with state red not start state here which is state 0, so when starts out tlc ,it starts with yellow signal
    parameter red=0,yellow=1,green=2,start=3;
    
     
    
    always@(posedge clk) begin
    case(state)
    
    start: begin
              if(on==1'b1)
                state<=red;
              else
                state<=start;
            end
            
     
     red: begin//till count!=5 only red led glow for that timeperiod
           if(count<5)begin
            tempr<=1'b1;
            tempy<=1'b0;
            tempg<=1'b0;
            count<=count+1;
           end
            else begin//when count =5 yellow lisght should glow
                count<=0;
                state<=yellow;
                end
           end
                
     yellow:   begin//till count!=5 only yellow led glow for that timeperiod
                  if(count<5) begin  
                    tempr<=1'b0;
                    tempy<=1'b1;
                    tempg<=1'b0;
                    count<=count+1;
                    end
                    else begin//when count =5 green lisght should glow
                        count<=0;
                        state<=green;
                        end
                 end
      green:  begin//till count!=5 only green led glow for that timeperiod
                    if(count<5)begin
                        tempr<=1'b0;
                        tempy<=1'b0;
                        tempg<=1'b1;
                        count<=count+1;
                        end
                        else begin//when count =5 red lisght should glow
                            count<=0;
                            state<=start;
                         end
               end
                            
      default: state<=start;
      
   endcase
  end
  
  assign r=tempr;
  assign y=tempy;
  assign g=tempg;
endmodule
