
`timescale 1 ns / 1 ps

	module Accelerator_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6,

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
    parameter [3:0] IDLE                        = 4'b0001; 
    parameter [3:0] ACCELERATION                = 4'b0010;
    parameter [3:0] CONFIGURATION               = 4'b0100;
    parameter [3:0] TRANSFER_CONFIGURATION      = 4'b1000;
        
    reg config_done;
    (* keep = "true" *) reg [3:0] exec_state;

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
    reg [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tstrb;
    reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] datain_Sregister;
    reg [C_S00_AXIS_TDATA_WIDTH-1 : 0] dataout_Sregister;
    assign s00_axis_tready  = s_axis_tready;
    assign m00_axis_tvalid	= m_axis_tvalid;
    assign m00_axis_tstrb	= m_axis_tstrb;   
    assign m00_axis_tstrb	= {(C_M00_AXIS_TDATA_WIDTH/8){1'b1}};
    assign m00_axis_tdata   = dataout_Sregister;
    assign m00_axis_tlast   = m_axis_tlast;
    (* keep = "true" *) reg flag_tlast;

    //CONFIGURATION (read/write) function, slower clock
    always@(posedge s00_axi_aclk)    
        begin
          if(!s00_axis_aresetn || !s00_axi_aresetn)     // Synchronous reset (active low)
            begin
              datain_AXI_register   <= 32'b0;
              dataout_AXI_register  <= 32'b0;
              config_register       <= 32'b0;
              config_done           <= 1'b0;
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
                    s_axi_rvalid        <= 1'b0;
                    s_axi_bvalid        <= 1'b0;
                        if (s00_axi_awvalid && s00_axi_wvalid && !s00_axis_tvalid) 	//GO TO CONFIGURATION (no stream)
                         begin
			                s_axi_awready       <= 1'b1;    //ready before valid handshake (I don't know the value of valid to put ready on)
                            s_axi_wready        <= 1'b1;
                            s_axi_awaddr  <= s00_axi_awaddr;
                            case (s_axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])  //takes 4 bits from the address
                                4'h0    : datain_AXI_register <= s00_axi_wdata;         //saving the value of register that is needed (aggiusta con il calcolo del registro
                                default : datain_AXI_register <= 32'b0;
                            endcase
                            config_done  <= 1'b0;           //The device has to be configured
                         end

                        else if (s00_axi_arvalid && !s00_axis_tvalid)            //GO TO TRANSFER CONFIGURATION (no stream)
                         begin
			                s_axi_arready       <= 1'b1;
                            s_axi_araddr  <= s00_axi_araddr;
                            case (s_axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB])
                                4'h0    : dataout_AXI_register <= config_register;         //sending the value of register that is needed (aggiusta con il calcolo del registro
                                default : dataout_AXI_register <= 32'b0;
                            endcase
			                 s_axi_rvalid        <= 1'b1; //data valid to be transfered
                         end
                    end
                else if (exec_state == CONFIGURATION)
                    begin
			            s_axi_awready       <= 1'b0;
                        s_axi_wready        <= 1'b0;
                        config_register     <= datain_AXI_register;                
                        config_done         <= 1'b1;               //CONFIGURATION FINISHED, GO TO IDLE
			            s_axi_bvalid        <= 1'b1;                
                    end
		         else if (exec_state == TRANSFER_CONFIGURATION)
                    begin        
			            s_axi_arready       <= 1'b0;        
           		        s_axi_rresp         <= 2'b0; // 'OKAY' response
                    end
            end
        end

    //tlast delayed 1clk cycle
	always @(posedge m00_axis_aclk)                                                                  
	begin                                                                                          
	  if (!m00_axis_aresetn)                                                                         
	    begin                                                                                                                                                  
          m_axis_tlast          <= 1'b0;                                                                
	    end                                                                                        
	  else
	   begin                                                                                                                                              
	      m_axis_tlast          <= flag_tlast;                                                          
	    end                                                                                        
	end 
	  	
    //ACCELERATION (read/write) function, Faster clock
    always@(posedge s00_axis_aclk)    
        begin
          if(!s00_axis_aresetn || !s00_axi_aresetn)     // Synchronous reset (active low)
            begin
              datain_Sregister      <= 32'b0;
              dataout_Sregister     <= 32'b0;
	          s_axis_tready         <= 1'b0;
	          m_axis_tvalid         <= 1'b0;
            end  
          else
            begin
                if (exec_state == IDLE)
                    begin
                        m_axis_tvalid       <= 1'b0;
                        if(s00_axis_tvalid)
                            begin
                                s_axis_tready       <= 1'b1;
                                datain_Sregister 	<= s00_axis_tdata;
                                if (s00_axis_tlast)
                                    begin
                                        flag_tlast  <= 1'b1;
                                    end
                            end
                    end
                else if (exec_state == ACCELERATION)
                    begin
		                s_axis_tready       <= 1'b0;
                        if (config_register == 32'b0)
                        begin
                            dataout_Sregister <= datain_Sregister;   //simply passing the value
                        end
                        else if (config_register == 32'b1)
                        begin
                            dataout_Sregister <= datain_Sregister + 1 ;   //incrementing the value     
                        end
		             m_axis_tvalid       <= 1'b1;	                            
                     end
            end 
        end
 
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
                      if (s00_axis_tvalid)
                        begin
                           exec_state <= ACCELERATION;
                        end
                      else if (s00_axi_awvalid && s00_axi_wvalid)  // valid data from the PS and ready for the response
                        begin
                            exec_state <= CONFIGURATION;
                        end
                      else if (s00_axi_arvalid)  // the PS can receive data, address valid
                        begin
                              exec_state <= TRANSFER_CONFIGURATION;
                        end               
                      else
                        begin
                           exec_state <= IDLE;
                        end
                  ACCELERATION:                         //data processing, tvalid LOW
                       if (m00_axis_tready) //m00_axis_tready HIGH, slave can accept data
                       begin
			             if (m_axis_tvalid)
				         begin
                            exec_state <= IDLE;     //data ready,tvalid HIGH, transfer done
                         end
                         else
                         begin
                          	exec_state <= ACCELERATION; //stay in ACCELERATION until the slave is ready
                         end
			           end
                  CONFIGURATION:
                        if (config_done & s00_axi_bready)
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
            
// User logic ends

	endmodule
