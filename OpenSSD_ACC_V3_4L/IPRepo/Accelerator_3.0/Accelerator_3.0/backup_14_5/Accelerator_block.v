`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2020 10:35:42 AM
// Design Name: 
// Module Name: Accelerator_block
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Accelerator_block(
    input  clk,
    input  reset,
    input  empty,
    input  last,
    input  full,
    output last_out,
    output valid_fifoin,
    output valid_fifoout,
    input  [127:0] data_in,
    output [127:0] data_out,
    input  [31:0] configuration,
    input  [127:0] start_counter,
    input  [127:0] parameter_128,
//    input  [191:0] parameter_192,
    input  [255:0] parameter_256
    );
    
    parameter [4:0] IDLE        = 5'b00001;
    parameter [4:0] WAIT_PIPE   = 5'b00010;
    parameter [4:0] RUN         = 5'b00100;
    parameter [4:0] WAIT        = 5'b01000;
    parameter [4:0] LAST_RUN    = 5'b10000;
    
    (* keep = "true" *) reg [4:0] exec_state; 
    
    (* keep = "true" *) reg  last_pipe;
    (* keep = "true" *) reg  last_reg;
    (* keep = "true" *) reg  valid_out;
    (* keep = "true" *) reg  valid_crypto;
    (* keep = "true" *) reg  enable;
    wire [127:0] crypto_128;
//    wire [127:0] crypto_192;
    wire [127:0] crypto_256;
    reg  [127:0] crypto_128_pipe;
//    reg  [127:0] crypto_192_pipe;
    reg  [127:0] crypto_256_pipe;
    wire [127:0] counter_data;
    reg  [127:0] counter;
    (* keep = "true" *) reg  [127:0] computed_data;
    (* keep = "true" *) reg  [127:0] data_in_pipe;
    (* keep = "true" *) wire valid_fifo_wire;
    (* keep = "true" *) reg  valid_fifoin_2;
    (* keep = "true" *) reg  valid_fifoin_3;
    
    assign data_out         = computed_data;
//    assign counter_data     = bitOrder(counter);
    assign counter_data     = counter;
    assign valid_fifo_wire  = enable && valid_crypto && !last;
    assign valid_fifoin     = valid_fifo_wire;
    assign valid_fifoout    = valid_out;
    assign last_out         = last_reg;
         
     aes_128 aes_128_inst(
     .clk(clk),
     .en(enable),
     .state(counter_data),
     .key(parameter_128),
     .out(crypto_128)
     );
 
//     aes_192 aes_192_inst(
//     .clk(clk),
//     .en(enable),
//     .state(counter_data),
//     .key(parameter_192),
//     .out(crypto_192)
//     );
        
     aes_256 aes_256_inst(
     .clk(clk),
     .en(enable),
     .state(counter_data),
     .key(parameter_256),
     .out(crypto_256)
     );
     
  always @ (posedge clk)        //output valid 3 clock cycle later (due to the read and the computation and the pipe)
   begin
    if(!reset)
        begin
            valid_fifoin_2  <= 0;
            valid_fifoin_3  <= 0;
            crypto_128_pipe <= 0;
//            crypto_192_pipe <= 0;
            crypto_256_pipe <= 0;
            data_in_pipe    <= 0;
            last_reg        <= 0;
            last_pipe       <= 0;
        end
    else 
        valid_fifoin_2 <= valid_fifo_wire;
        valid_fifoin_3 <= valid_fifoin_2;
        if(valid_fifoin_2)
            begin
                valid_out      <= valid_fifoin_3;	    //in the deactivation from the wait, the output fifo goes on (and it shouldn't)
            end
        else
            begin
                valid_out      <= 0;
            end

        if(valid_fifoin_2 || last_pipe)			//instead of enable
            begin                                   //pipe register
                last_pipe       <= last;
                last_reg        <= last_pipe;
                crypto_128_pipe <= bitOrder(crypto_128);
//                crypto_192_pipe <= bitOrder(crypto_192);
                crypto_256_pipe <= bitOrder(crypto_256);
                data_in_pipe    <= data_in;
            end
        else
            begin
                last_reg  <= 1'b0;
            end
   end
  
  //COMPUTATION
  always @ (posedge clk)     
        begin
            if (!reset)
             begin
                computed_data   <= 32'b0;
             end                      
            else if (valid_fifoin_3)
             begin
                 case (configuration)
                         32'h0:
                             begin
                                 computed_data = data_in_pipe;
                             end
                         32'h1:
                             begin
                                 computed_data = data_in_pipe + parameter_128;
                             end                                  
                         32'h2:
                             begin
                                 computed_data = data_in_pipe ^ crypto_128_pipe;
                             end
//                         32'h4:
//                             begin
//                                 computed_data = data_in_pipe ^ crypto_192_pipe;
//                             end
                         32'h8:
                             begin
                                 computed_data = data_in_pipe ^ crypto_256_pipe;
                             end
                         // otherwise, do nothing (not configured cases)
                 endcase
             end 
        end    
  
  //COUNTER
  always @ (posedge clk)
     begin
         if (!reset)
             begin
             valid_crypto   <= 1'b0;
             counter        <= start_counter;
             end
         else if(exec_state == RUN)      // to avoid an unwanted valid HIGH              
            begin
                if(valid_crypto && last && !full)               //reset of the counter/valid_crypto in LAST_RUN
                    begin
                        counter         <= start_counter;
                        valid_crypto    <= 1'b0;
                    end
            end
         else if(enable && !last_pipe)
             begin
                 counter <= counter + 128'h1;
                 case (configuration)
                     32'h0:
                         begin
                            valid_crypto = 1'b1;
                         end
                     32'h1:
                         begin
                            valid_crypto = 1'b1;
                         end                            
                     32'h2:
                         begin
                             if(counter == start_counter + 128'h13)        //128  -- 21 clock cycles (1 initial + d20, h14. -1 for activation before the valid,+1-1 for the pipe register)
                                 begin
                                     valid_crypto = 1'b1;
                                 end
                         end
//                     32'h4:
//                         begin
//                             if(counter == start_counter + 128'h17)        //192  -- 25 clock cycles (h18)
//                                 begin
//                                     valid_crypto = 1'b1;
//                                 end
//                         end
                     32'h8:
                         begin
                             if(counter == start_counter + 128'h1B)        //256  -- 29 clock cycles (h1D)
                                 begin
                                     valid_crypto = 1'b1;
                                 end
                         end
                 // otherwise, do nothing
                 endcase
             end
     end
  
  // FSM
      always @(posedge clk)     
          begin                           
            if (!reset)        // Synchronous reset (active low)
              begin
              exec_state <= IDLE;       
              end 
            else
              begin
                  case (exec_state)
                    IDLE:
                         if(!empty && !full) 
                          begin
                              exec_state <= WAIT_PIPE;
                          end
                         else
                          begin
                              exec_state <= IDLE;
                          end
                    WAIT_PIPE:
                         if(valid_crypto && (empty || full))                //it should not happen (if it was ok in IDLE...but it means something went wrong)
                            begin
                                exec_state <= WAIT;
                            end
                         else if(valid_crypto && !empty && !full)
                            begin
                                exec_state <= RUN;
                            end                                                      
                         else
                            begin
                                exec_state <= WAIT_PIPE;
                            end    
                    RUN:
                         if(valid_crypto && ((empty && (!last))||full))
                          begin
                              exec_state <= WAIT;    
                          end   
                         else if(valid_crypto && !empty && !full)
                          begin
                              exec_state <= RUN;
                          end
			             else if(valid_crypto && last && !full)
                          begin
                              exec_state <= LAST_RUN;         
                          end 
                    WAIT:
                         if(valid_crypto && !empty && !full)
                           begin
                               exec_state <= RUN;
                           end
                         else if(valid_crypto && last && !full)
                           begin
                               exec_state <= LAST_RUN;
                           end
                         else
                           begin
                               exec_state <= WAIT;
                           end
                    LAST_RUN:
                         begin
                            exec_state <= IDLE; 
                         end
                  endcase                        
              end
         end
         
 //COMPUTATION function, slower clock
            always@(posedge clk)    
                begin
                  if(!reset)     // Synchronous reset (active low)
                    begin
                      enable          <= 1'b0;
                    end  
                  else
                    begin
                        if (exec_state == IDLE)
                         begin
                            if(!empty && !full)    				 // to WAIT_PIPE
                                begin
                                    enable       <= 1'b1;                        //activates the counter and the cores        
                                end
                         end
                         
                        else if (exec_state == WAIT_PIPE)
                         begin
                            if(valid_crypto && (empty || full))                     //to WAIT (not happening)
                                begin
                                    enable       <= 1'b0;
                                end
                            else if(valid_crypto && !empty && !full)                 //to RUN
                                begin
                                    enable       <= 1'b1;
                                end
                         end
                               
                        else if (exec_state == RUN)
                          begin
                            if(valid_crypto && ((empty && (!last))||full))                       //to WAIT
                              begin
                                enable       <= 1'b0;
                              end
                            else if (valid_crypto && ((!empty)||last) && !full)                //to LAST_RUN or RUN
                              begin
                                enable       <= 1'b1;
                            end                                                     
                          end
                          
                        else if (exec_state == WAIT)
                           begin
                            if(valid_crypto && ((!empty)||last) && !full)                    //to to LAST_RUN or RUN
                              begin
                                enable       <= 1'b1;
                              end
                           end
                           
                        else if (exec_state == LAST_RUN)
                              begin
                                enable       <= 1'b0;
                              end                                                        
                    end
                end

//Function for reversing the number of bits in a parallel bus.
function [127:0] bitOrder 
    (
    input [127:0] data
    );
    integer i;
    begin
        for (i=0; i < 128; i=i+1) begin : reverse
            bitOrder[127-i] = data[i]; //Note how the vectors get swapped around here by the index. For i=0, i_out=15, and vice versa.
        end
    end
endfunction


         
endmodule
