`timescale 1 ns / 1 ps

	module Accelerator_v2_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
        parameter integer C_M00_AXIS_START_COUNT    = 32,
        
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI               //to be defined with the configuration register/state
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid
	);

// Add user logic here
    parameter acceleration_type                 = 0;    
    parameter [8:0] IDLE                        = 9'b000000001; //1
    parameter [8:0] FIRST_ACCELERATION          = 9'b000000010; //2
    parameter [8:0] ACCELERATION                = 9'b000000100; //4
    parameter [8:0] WAIT_MREADY                 = 9'b000001000; //8
    parameter [8:0] RETURN_MREADY               = 9'b000010000; //16
    parameter [8:0] WAIT_SVALID                 = 9'b000100000; //32
    parameter [8:0] LAST_ACCELERATION           = 9'b001000000; //64
    parameter [8:0] CONFIGURATION               = 9'b010000000; //128
    parameter [8:0] TRANSFER_CONFIGURATION      = 9'b100000000; //256
        
    (* keep = "true" *) reg [8:0] exec_state;

    reg [C_S00_AXI_DATA_WIDTH-1 : 0]  config_register;
    
    //AXI
    localparam integer ADDR_LSB = (C_S00_AXI_DATA_WIDTH/32) + 1;
    localparam integer OPT_MEM_ADDR_BITS = 3;

    reg s_axi_awready;
    reg s_axi_wready;
    reg s_axi_bvalid;
    reg s_axi_arready;
    reg s_axi_rvalid;
    reg [1 : 0] s_axi_bresp;
    reg [1 : 0] s_axi_rresp;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr;
    reg [C_S00_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr;
    reg [C_S00_AXI_DATA_WIDTH-1 : 0] datain_AXI_register;
    reg [C_S00_AXI_DATA_WIDTH-1 : 0] dataout_AXI_register;
    assign s00_axi_awready  = s_axi_awready;
    assign s00_axi_wready   = s_axi_wready;
    assign s00_axi_bvalid   = s_axi_bvalid;
    assign s00_axi_bresp    = s_axi_bresp;
    assign s00_axi_rresp    = s_axi_rresp;
    assign s00_axi_rdata    = dataout_AXI_register;
    assign s00_axi_arready  = s_axi_arready;
    assign s00_axi_rvalid   = s_axi_rvalid;
    
    //AXI STREAM
    reg s_axis_tready;
    reg m_axis_tvalid;
    reg m_axis_tlast;
    reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] datain_Sregister;
    reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] dataout_Sregister;
    reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] data_recover_wait;
    assign s00_axis_tready  = s_axis_tready;
    assign m00_axis_tvalid	= m_axis_tvalid;  
    assign m00_axis_tstrb	= {(C_M00_AXIS_TDATA_WIDTH/8){1'b1}};
    assign m00_axis_tdata   = dataout_Sregister;
    assign m00_axis_tlast   = m_axis_tlast;
    (* keep = "true" *) reg flag_tlast;


    // FSM slower clock
    always @(posedge s00_axi_aclk)     
        begin                           
          if (!s00_axis_aresetn || !s00_axi_aresetn)        // Synchronous reset (active low)
            begin
            exec_state <= IDLE;       
            end 
          else
            begin
                case (exec_state)
                  IDLE:
                       if (s00_axi_awvalid && s00_axi_wvalid)  // valid data from the PS and ready for the response
                        begin
                            exec_state <= CONFIGURATION;
                        end
                       else if (s00_axi_arvalid)                // the PS can receive data, address valid
                        begin
                            exec_state <= TRANSFER_CONFIGURATION;
                        end               
                       else if (m00_axis_tready && s00_axis_tvalid)
                        begin
                            exec_state <= FIRST_ACCELERATION;
                        end
                       else
                        begin
                            exec_state <= IDLE;
                        end
                        
                  FIRST_ACCELERATION:
                       if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)
                        begin
                            exec_state <= LAST_ACCELERATION;    //just 32 bit, single and last event
                        end
                       else if(m00_axis_tready && s00_axis_tvalid)
                        begin
                            exec_state <= ACCELERATION;         //data ready,tvalid HIGH, transfer done
                        end     
                       else if((!m00_axis_tready)||(!s00_axis_tvalid && !flag_tlast))
                        begin
                             if(!m00_axis_tready)
                                begin
                                  exec_state <= WAIT_MREADY;                  //stay in WAIT until the slave is ready
                                end
                             else if(!s00_axis_tvalid && !flag_tlast)    
                                begin
                                  exec_state <= WAIT_SVALID;                  //stay in WAIT until the master has given valid data (unless it is the end)
                                end
                        end
                                    
                  ACCELERATION:                                 //data processing
                       if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)
                         begin
                             exec_state <= LAST_ACCELERATION;    //last event
                         end
                        else if(m00_axis_tready && s00_axis_tvalid)
                         begin
                             exec_state <= ACCELERATION;         
                         end     
                       else if((!m00_axis_tready)||(!s00_axis_tvalid && !flag_tlast))
                        begin
                             if(!m00_axis_tready)
                               begin
                                 exec_state <= WAIT_MREADY;                  //stay in WAIT until the slave is ready
                               end
                             else if(!s00_axis_tvalid && !flag_tlast)    
                               begin
                                 exec_state <= WAIT_SVALID;                  //stay in WAIT until the master has given valid data (unless it is the end)
                               end                        
                        end
                       			      
			      WAIT_MREADY:
			           if(m00_axis_tready && flag_tlast)
			            begin
			               exec_state <= LAST_ACCELERATION;                 //the lost data is the LAST one (WAIT at LAST)
			            end
			           else if(m00_axis_tready)
			            begin
                           exec_state <= RETURN_MREADY;     
                        end
                       else
			            begin
			                exec_state <= WAIT_MREADY;
			            end
			      
			      RETURN_MREADY:
                       if(m00_axis_tready && s00_axis_tvalid)
                        begin
                            exec_state <= ACCELERATION;     
                        end
//                       else if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)
//                        begin
//                            exec_state <= LAST_ACCELERATION;
//                        end
                       else
                        begin
                            exec_state <= RETURN_MREADY;
                        end
                        			            
			      WAIT_SVALID:
                       if(m00_axis_tready && s00_axis_tvalid)
                        begin
                            exec_state <= FIRST_ACCELERATION;     
                        end
                       else
                        begin
                            exec_state <= WAIT_SVALID;
                        end			      
			            
			      LAST_ACCELERATION:
			           begin
			               exec_state <= IDLE;
			           end
			           
                  CONFIGURATION:
                       if (s00_axi_bready)
                        begin
                           exec_state <= IDLE;
                        end
                       else
                        begin
                           exec_state <= CONFIGURATION;
                        end
                  
                  TRANSFER_CONFIGURATION:
                       if (s00_axi_rready)             //s00_axi_rready HIGH, the PS can receive data
                        begin
                           exec_state <= IDLE;
                        end
                       else
                        begin
                           exec_state <= TRANSFER_CONFIGURATION;     //stay in TRANSFER_CONFIGURATION until the master is ready
                        end                                 
                endcase
            end
        end                 
	  	
    //ACCELERATION (read/write) function, Faster clock
    always@(posedge s00_axis_aclk)    
        begin
          if(!s00_axis_aresetn || !s00_axi_aresetn)     // Synchronous reset (active low)
            begin
              datain_Sregister      <= 32'b0;
              dataout_Sregister     <= 32'b0;
              data_recover_wait     <= 32'b0;
	          s_axis_tready         <= 1'b0;
	          m_axis_tvalid         <= 1'b0;
            end  
          else
            begin
                if (exec_state == IDLE)
                    begin
                        if((s00_axi_awvalid && s00_axi_wvalid) || s00_axi_arvalid)        //AXI operation, deactivate AXIS
                            begin
                                s_axis_tready        <= 1'b0;
                            end
                        else 
                            begin
                                if(!m00_axis_tready && !s00_axis_tvalid)                        //no  operation, device ready
                                    begin
                                        s_axis_tready       <= 1'b1;
                                        m_axis_tvalid       <= 1'b0;
                                    end
                                else if(m00_axis_tready && s00_axis_tvalid)                    //to FIRST_ACCELERATION
                                    begin
                                        datain_Sregister 	<= s00_axis_tdata;
                                    end
                            end
                    end
                    
                else if (exec_state == FIRST_ACCELERATION)
                    begin
                        if ((!m00_axis_tready)||(!s00_axis_tvalid && !flag_tlast))   //to WAIT (need to stop the execution)
                            begin
                                if(!m00_axis_tready && s00_axis_tvalid)                                 //to WAIT_MREADY (if there is a new data, save it...tvalid HIGH)
                                    begin
                                        data_recover_wait <= s00_axis_tdata;
                                    end                                              //for WAIT_MVALID nothing specific to be done
                                s_axis_tready   <= 1'b0;
                                m_axis_tvalid   <= 1'b0;
                            end
                        
                        else if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)             //to LAST ACCELERATION
                            begin
                               s_axis_tready        <= 1'b0;        //now the input is deactivated (single transfer)
                               m_axis_tvalid        <= 1'b1;        //now the output is activated
                               if (config_register == 32'b0)
                                   begin
                                       dataout_Sregister <= datain_Sregister;   //simply passing the value
                                   end
                               else if (config_register == 32'b1)
                                   begin
                                       dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                   end
//                               datain_Sregister     <= s00_axis_tdata;   
                            end
                        
                        else if(m00_axis_tready && s00_axis_tvalid)                                //to ACCELERATION
                            begin
                                m_axis_tvalid       <= 1'b1;        //now the output is activated
                                if (config_register == 32'b0)
                                    begin
                                        dataout_Sregister <= datain_Sregister;   //simply passing the value
                                    end
                                else if (config_register == 32'b1)
                                    begin
                                        dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                    end
                                datain_Sregister     <= s00_axis_tdata;
                            end
                    end                   

                else if (exec_state == ACCELERATION)
                    begin                         
                        if ((!m00_axis_tready)||(!s00_axis_tvalid && !flag_tlast))   //to WAIT (need to stop the execution)
                            begin
                                if(!m00_axis_tready && s00_axis_tvalid)                                 //to WAIT_MREADY
                                    begin
                                        data_recover_wait <= s00_axis_tdata;  
                                    end                                              //for WAIT_MVALID nothing specificto be done
                                s_axis_tready   <= 1'b0;
                                m_axis_tvalid   <= 1'b0;
                            end
                            
                         else if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)             //to LAST ACCELERATION
                            begin
                               s_axis_tready        <= 1'b0;                    //INPUT down
                               if (config_register == 32'b0)
                                   begin
                                       dataout_Sregister <= datain_Sregister;   //simply passing the value
                                   end
                               else if (config_register == 32'b1)
                                   begin
                                       dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                   end
//                               datain_Sregister 	<= s00_axis_tdata;   
                            end
                            
                         else if(m00_axis_tready && s00_axis_tvalid)                                //to ACCELERATION
                            begin
                                if (config_register == 32'b0)
                                    begin
                                        dataout_Sregister <= datain_Sregister;   //simply passing the value
                                    end
                                else if (config_register == 32'b1)
                                    begin
                                        dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                    end
                                datain_Sregister     <= s00_axis_tdata;
                            end                   
                     end
                     
                else if (exec_state == LAST_ACCELERATION)
                    begin
                        m_axis_tvalid         <= 1'b0;                      //last transfer done, OUTPUT down
//                        if (config_register == 32'b0)
//                            begin
//                                dataout_Sregister <= datain_Sregister;   //simply passing the value
//                            end
//                        else if (config_register == 32'b1)
//                            begin
//                                dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
//                            end
                    end
                    
                else if (exec_state == WAIT_MREADY)
                    begin
                    	if(m00_axis_tready && flag_tlast)  //to LAST_ACCELERATION (wait at the first acceleration
                         begin
                             if (config_register == 32'b0)
                                 begin
                                     dataout_Sregister <= datain_Sregister;   //simply passing the value
                                 end
                             else if (config_register == 32'b1)
                                 begin
                                     dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                 end                            
//                            datain_Sregister    <= data_recover_wait;           //no more data, possible to directly pass the lost packet
                            s_axis_tready       <= 1'b0;
                            m_axis_tvalid       <= 1'b1;
                         end
                        else if(m00_axis_tready)          //to RETURN_MREADY
                            begin
                                s_axis_tready   <= 1'b0;
                                m_axis_tvalid   <= 1'b1;
                            end            
                    end                   
                    
                else if (exec_state == RETURN_MREADY)
                    begin
                        if(m00_axis_tready && s00_axis_tvalid)          //to ACCELERATION
                            begin
                                if (config_register == 32'b0)
                                    begin
                                        dataout_Sregister <= datain_Sregister;   //simply passing the value
                                    end
                                else if (config_register == 32'b1)
                                    begin
                                        dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                                    end
                               datain_Sregister <= data_recover_wait;
                               s_axis_tready    <= 1'b1;
                               m_axis_tvalid    <= 1'b1;
                            end                       
                    end                    
                    
                else if (exec_state == WAIT_SVALID)
                    begin
                        if(m00_axis_tready && s00_axis_tvalid)          //to FIRST_ACCELERATION (the last data is already received by the slave. ACCELERATION without output needed)
                            begin
                                s_axis_tready   <= 1'b1;
                                m_axis_tvalid   <= 1'b0;
                            end                          
                    end                 
            end 
        end
    
        //tlast delayed 1clk cycle
        always @(posedge m00_axis_aclk)                                                                  
        begin                                                                                          
          if (!m00_axis_aresetn)                                                                         
            begin                                                                                                                                
              flag_tlast            <= 1'b0;
              m_axis_tlast          <= 1'b0;                                                               
            end                                                                                        
          else
           begin
               if (exec_state == IDLE)
                  begin
                    flag_tlast            <= 1'b0;
                    m_axis_tlast          <= 1'b0;
                  end
               else
                  begin 
                    if(s00_axis_tvalid)
                        begin
                            flag_tlast            <= s00_axis_tlast;
                        end
                    if(m00_axis_tready && !s00_axis_tvalid && flag_tlast)
                        begin 
                            m_axis_tlast          <=  flag_tlast;
                        end
                  end                                                         
           end                                                                                        
        end


    //CONFIGURATION (read/write) function, slower clock
    always@(posedge s00_axi_aclk)    
        begin
          if(!s00_axis_aresetn || !s00_axi_aresetn)     // Synchronous reset (active low)
            begin
              datain_AXI_register   <= 32'b0;
              dataout_AXI_register  <= 32'b0;
              config_register       <= 32'b0;
              s_axi_awready       <= 1'b0;
              s_axi_wready        <= 1'b0;
              s_axi_bvalid        <= 1'b0;
              s_axi_arready       <= 1'b0;	      
              s_axi_rvalid        <= 1'b0;
              s_axi_bresp         <= 2'b0; // 'OKAY' response
              s_axi_rresp         <= 2'b0; // 'OKAY' response
            end  
          else
            begin
                if (exec_state == IDLE)
                begin
                    s_axi_rvalid     <= 1'b0;
                    s_axi_bvalid     <= 1'b0;
                    if(s00_axi_awvalid && s00_axi_wvalid)    //to CONFIGURATION (write)
                        begin
                            s_axi_awready       <= 1'b0;        //deactivate all the ready signals
                            s_axi_wready        <= 1'b0;
                            s_axi_arready       <= 1'b0;
                            s_axi_awaddr        <= s00_axi_awaddr;
                            case (s_axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])  //takes 4 bits from the address
                                4'h0    : datain_AXI_register <= s00_axi_wdata;         //saving the value of register that is needed (aggiusta con il calcolo del registro
                                default : datain_AXI_register <= 32'b0;
                            endcase
                            s_axi_bvalid        <= 1'b1;         //response valid to be transfered                     
                        end
                    else if(s00_axi_arvalid)                     //to TRANSFER (read)
                        begin
                            s_axi_awready       <= 1'b0;
                            s_axi_wready        <= 1'b0;
                            s_axi_arready       <= 1'b0;
                            s_axi_araddr        <= s00_axi_araddr;
                            case (s_axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
                                4'h0    : dataout_AXI_register <= config_register;         //sending the value of register that is needed (aggiusta con il calcolo del registro
                                default : dataout_AXI_register <= 32'b0;
                            endcase
                            s_axi_rvalid        <= 1'b1;        //data/response valid to be transfered                                
                        end
                    else if(s00_axis_tvalid)                    //to ACCELERATION -- AXI not ready/valid
                        begin
                            s_axi_awready       <= 1'b0;
                            s_axi_wready        <= 1'b0;
                            s_axi_arready       <= 1'b0;
                        end
                    else                                        //no  operation, AXI ready
                        begin
                            s_axi_awready       <= 1'b1;
                            s_axi_wready        <= 1'b1;
                            s_axi_arready       <= 1'b1; 
                        end
                end
                else if (exec_state == CONFIGURATION)
                    begin
                        config_register     <= datain_AXI_register;                  
                    end
//                 else if (exec_state == TRANSFER_CONFIGURATION)
//                    begin        
//                    end
            end
        end
             
// User logic ends

	endmodule