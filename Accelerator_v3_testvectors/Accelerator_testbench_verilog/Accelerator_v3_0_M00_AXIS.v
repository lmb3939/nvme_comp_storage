
`timescale 1 ns / 1 ps

	module Accelerator_v3_0_M00_AXIS #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		parameter integer C_M_AXIS_TDATA_WIDTH	= 128,
		// Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.
		parameter integer C_M_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global ports
		input wire  M_AXIS_ACLK,
		// 
		input wire  M_AXIS_ARESETN,
		// Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		output wire M_AXIS_TVALID,
		// TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
		// TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB,
		// TLAST indicates the boundary of a packet.
		output wire M_AXIS_TLAST,
		// TREADY indicates that the slave can accept a transfer in the current cycle.
		input wire  M_AXIS_TREADY,
		//data from the accelerator
		input wire  [C_M_AXIS_TDATA_WIDTH-1 :0] DATA_IN,
		//full flag
		output wire FULL,
		//valid input data
		input  wire VALID_IN,
		//last_in
		input  wire LAST_IN
	);                                          
	                                                                                     
	// function called clogb2 that returns an integer which has the                      
	// value of the ceiling of the log base 2.                                           
	function integer clogb2 (input integer bit_depth);                                   
	  begin                                                                              
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
	      bit_depth = bit_depth >> 1;                                                    
	  end                                                                                
	endfunction                                                                                           
	
	// Total number of input data. (maximum amount of data, 16KB = (128bit/8)*1024 word
    localparam NUMBER_OF_INPUT_WORDS  = 512;                                                                                    
	// bit_num gives the minimum number of bits needed to address 'depth' size of FIFO.  
	localparam bit_num  = clogb2(NUMBER_OF_INPUT_WORDS);                                
	
	// FIFO write pointer                                                  
    (* keep = "true" *) reg [bit_num-1:0] write_pointer;                                                                                       
	// FIFO read pointer                                                  
	(* keep = "true" *) reg [bit_num-1:0] read_pointer;
	
	(* keep = "true" *) reg [bit_num-1:0] status_cnt;                                                                                                                     

    	//FIFO (no data strobe)
	reg  [(C_M_AXIS_TDATA_WIDTH)-1:0] stream_data_fifo [0 : NUMBER_OF_INPUT_WORDS-1]; //array of NUMBER_OF_INPUT_WORDS slot of C_M_AXIS_TDATA_WIDTH bit each
    reg  last_fifo [0 : NUMBER_OF_INPUT_WORDS-1];
    reg  [C_M_AXIS_TDATA_WIDTH-1 :0] FIFO_DATA_OUT;
    reg  FIFO_LAST_OUT;
//streaming data valid
	(* keep = "true" *)  wire  	axis_tvalid;
    //streaming data valid delayed by one clock cycle
	(* keep = "true" *)  reg  	axis_tvalid_delay;
	//full_wire
    wire full_wire;
    //enable wires
    wire tx_en;
    wire rx_en;
    
    // I/O Connections assignments
    assign M_AXIS_TDATA  = FIFO_DATA_OUT;
    assign M_AXIS_TLAST  = FIFO_LAST_OUT;
    assign M_AXIS_TVALID = axis_tvalid_delay;
    assign axis_tvalid   = (status_cnt > 0);
    assign M_AXIS_TSTRB  = {(C_M_AXIS_TDATA_WIDTH/8){1'b1}}; 
    
    //tvalid generation
    //number of output streaming data is more than the 0.
    assign full_wire = (status_cnt == NUMBER_OF_INPUT_WORDS);
    assign FULL      = full_wire;
    
    assign rx_en = (VALID_IN || LAST_IN) && (status_cnt  != NUMBER_OF_INPUT_WORDS);
    assign tx_en = M_AXIS_TREADY && axis_tvalid && (status_cnt  != 0);
    
	// Delay the axis_tvalid and signal by one clock cycle (latency in the FIFO)
	always @(posedge M_AXIS_ACLK)                                                                  
	begin                                                                                          
	  if (!M_AXIS_ARESETN)                                                                         
	    begin                                                                                      
	      axis_tvalid_delay <= 1'b0;                                                               
	    end                                                                                        
	  else if(M_AXIS_TREADY)                                                                                       
	    begin                                                                                      
	      axis_tvalid_delay <= axis_tvalid;                                                          
	    end                                                                                        
	end     
                                                                                                       
	always @( posedge M_AXIS_ACLK)               //WRITE (rx)
           begin
              if (!M_AXIS_ARESETN) 
               begin
                  write_pointer <= 0;
               end
              else if (rx_en)// && S_AXIS_TSTRB[byte_index]) strobe not used
                begin
                  stream_data_fifo[write_pointer] <= DATA_IN;
                  last_fifo[write_pointer]        <= LAST_IN;
                  write_pointer                   <= write_pointer + 1;
                end
              else if(M_AXIS_TLAST)             //reset variables
                begin
                  write_pointer                   <= 1'b0;
                end   
           end  
                  
    always @ (posedge M_AXIS_ACLK)                 //READ (tx)
           begin
            if (!M_AXIS_ARESETN) 
                begin
                    read_pointer  <= 0;
                    FIFO_DATA_OUT <= 0;
                    FIFO_LAST_OUT <= 0;
                end
             else
                begin
                     if (axis_tvalid)
                        begin
                            FIFO_DATA_OUT       <= stream_data_fifo[read_pointer];
                            FIFO_LAST_OUT       <= last_fifo[read_pointer];  
                        end
                     if (tx_en)
                        begin                  
                            read_pointer        <= read_pointer + 1;
                        end
                     else if(M_AXIS_TLAST)               //reset variables
                        begin
                             read_pointer        <= 1'b0;
                             FIFO_LAST_OUT       <= 1'b0;
                        end
                end
           end                                                                                                                                                                                                                                                                                          


   always @(posedge M_AXIS_ACLK)                       //STATUS COUNTER
           begin 
             if (!M_AXIS_ARESETN) 
              begin
                status_cnt <= 0;
              end
             else if (tx_en &&  !rx_en)                  // Read but no write.
              begin
               status_cnt <= status_cnt - 1;
              end
             else if (rx_en && !tx_en)          // Write but no read.
              begin
                status_cnt <= status_cnt + 1;
              end
           end 
	// Add user logic here

	// User logic ends

	endmodule
