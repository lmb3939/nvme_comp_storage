
�
eCannot write hardware definition file as there are no IPI block design hardware handoff files present188*	vivadotclZ4-424h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2020.012default:default2
-1162default:defaultZ17-1223h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[11] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[5]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[5]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[12] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[6]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[6]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[13] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[7]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[7]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[14] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[8]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[8]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/ramb36sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[5]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[11] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[5]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[6]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[12] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[6]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[7]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[13] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[7]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[8]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[14] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[8]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[9]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[5]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[5]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[11] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[6]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[6]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[12] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[7]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[7]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[13] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[8]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[8]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[14] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[9]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[9]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/ramb36sdp_1/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18392default:default2.
RAMB36 async control check2default:default2�
�The RAMB36E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/genblk3_0.bram36_sdp_bl_2.bram36_sdp_bl_2/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/ramb36sdp_1/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_cntl_slave_inst0/pcie_cntl_rx_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/dma_done_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/ramb18sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/dma_cmd_inst0/pcie_dma_cmd_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/ramb18sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_rx_dma_inst0/pcie_rx_cmd_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/ramb18sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/dma_if_inst0/pcie_tx_dma_inst0/pcie_tx_cmd_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[10] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[5]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[5]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[11] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[6]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[6]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[9] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/ramb18sdp_0/Q[4]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_hcmd_sq_fifo_inst0/r_rear_addr_reg[4]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_dp_bl.bram18_tdp_bl has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_dp_bl.bram18_tdp_bl/ADDRBWRADDR[4] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_dp_bl.bram18_tdp_bl has an input control pin NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_dp_bl.bram18_tdp_bl/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/nvme_pcie_inst0/pcie_hcmd_inst0/pcie_hcmd_sq_inst0/pcie_sq_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_rx_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[5] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/Q[0]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/r_rear_addr_reg[0]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[6] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/Q[1]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/r_rear_addr_reg[1]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[7] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/Q[2]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/r_rear_addr_reg[2]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
�	
Rule violation (%s) %s - %s
20*drc2
	REQP-18402default:default2.
RAMB18 async control check2default:default2�
�The RAMB18E1 NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3 has an input control pin NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/genblk3_0.bram18_sdp_bl_3.bram18_sdp_bl_3/ADDRBWRADDR[8] (net: NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/ramb18sdp_0/Q[3]) which is driven by a register (NVMeHostController4L_0/inst/user_top_inst0/s_axi_top_inst0/m_axi_dma_inst0/dev_tx_cmd_fifo_inst0/r_rear_addr_reg[3]) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.2default:defaultZ23-20h px� 
c
DRC finished with %s
79*	vivadotcl2)
0 Errors, 73 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.122default:default2
00:00:00.132default:default2
3271.1642default:default2
0.0002default:default2
64372default:default2
261902default:defaultZ17-722h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.052default:default2
00:00:00.052default:default2
3271.1642default:default2
0.0002default:default2
64352default:default2
261872default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
t

Phase %s%s
101*constraints2
1.1.1 2default:default2#
Pre-Place Cells2default:defaultZ18-101h px� 
F
1Phase 1.1.1 Pre-Place Cells | Checksum: 24e39fc6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:05 ; elapsed = 00:00:03 . Memory (MB): peak = 3271.164 ; gain = 0.000 ; free physical = 6440 ; free virtual = 261872default:defaulth px� 
�7
bAn IO Bus %s with more than one IO standard is found. Components associated with this bus are: %s
12*place2 
FIXED_IO_mio2default:default2�5
� 
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[53]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[52]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[51]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[50]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[49]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[48]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[47]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[46]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[45]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[44]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[43]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[42]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[41]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[40]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[39]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[38]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[37]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[36]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[35]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[34]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[33]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[32]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[31]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[30]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[29]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[28]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[27]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[26]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[25]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[24]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[23]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[22]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[21]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[20]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[19]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[18]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[17]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[16]<MSGMETA::END> of IOStandard HSTL_I_18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[15]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[14]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[13]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[12]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[11]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[10]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[9]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[8]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[7]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[6]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[5]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[4]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[3]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[2]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[1]<MSGMETA::END> of IOStandard LVCMOS18
	<MSGMETA::BEGIN::BLOCK>FIXED_IO_mio[0]<MSGMETA::END> of IOStandard LVCMOS18"3
FIXED_IO_mio[53]2
	: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[52]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[51]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[50]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[49]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[48]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[47]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[46]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[45]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[44]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[43]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[42]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[41]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[40]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[39]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[38]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[37]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[36]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[35]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[34]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[33]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[32]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[31]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[30]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[29]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[28]: of IOStandard LVCMOS18
	"0
FIXED_IO_mio[27]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[26]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[25]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[24]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[23]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[22]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[21]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[20]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[19]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[18]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[17]: of IOStandard HSTL_I_18
	"0
FIXED_IO_mio[16]: of IOStandard HSTL_I_18
	"/
FIXED_IO_mio[15]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[14]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[13]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[12]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[11]: of IOStandard LVCMOS18
	"/
FIXED_IO_mio[10]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[9]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[8]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[7]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[6]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[5]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[4]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[3]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[2]: of IOStandard LVCMOS18
	".
FIXED_IO_mio[1]: of IOStandard LVCMOS18
	",
FIXED_IO_mio[0]: of IOStandard LVCMOS182default:default8Z30-12h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
x

Phase %s%s
101*constraints2
1.1.2 2default:default2'
IO and Clk Clean Up2default:defaultZ18-101h px� 
J
5Phase 1.1.2 IO and Clk Clean Up | Checksum: 24e39fc6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6431 ; free virtual = 261842default:defaulth px� 
�

Phase %s%s
101*constraints2
1.1.3 2default:default2>
*Implementation Feasibility check On IDelay2default:defaultZ18-101h px� 
a
LPhase 1.1.3 Implementation Feasibility check On IDelay | Checksum: 24e39fc6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6431 ; free virtual = 261842default:defaulth px� 
x

Phase %s%s
101*constraints2
1.1.4 2default:default2'
Commit IO Placement2default:defaultZ18-101h px� 
J
5Phase 1.1.4 Commit IO Placement | Checksum: 3e45a0e0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6431 ; free virtual = 261842default:defaulth px� 
g
RPhase 1.1 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 47203ce3
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6431 ; free virtual = 261842default:defaulth px� 
}

Phase %s%s
101*constraints2
1.2 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
v

Phase %s%s
101*constraints2
1.2.1 2default:default2%
Place Init Design2default:defaultZ18-101h px� 
~

Phase %s%s
101*constraints2
1.2.1.1 2default:default2+
Init Lut Pin Assignment2default:defaultZ18-101h px� 
Q
<Phase 1.2.1.1 Init Lut Pin Assignment | Checksum: 13fff5a11
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:20 ; elapsed = 00:00:12 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6431 ; free virtual = 261832default:defaulth px� 
H
3Phase 1.2.1 Place Init Design | Checksum: e95db92f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:45 ; elapsed = 00:00:19 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6425 ; free virtual = 261782default:defaulth px� 
O
:Phase 1.2 Build Placer Netlist Model | Checksum: e95db92f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:45 ; elapsed = 00:00:19 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6425 ; free virtual = 261782default:defaulth px� 
z

Phase %s%s
101*constraints2
1.3 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.3.1 2default:default24
 Constrain Global/Regional Clocks2default:defaultZ18-101h px� 
W
BPhase 1.3.1 Constrain Global/Regional Clocks | Checksum: e95db92f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:45 ; elapsed = 00:00:19 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6425 ; free virtual = 261782default:defaulth px� 
L
7Phase 1.3 Constrain Clocks/Macros | Checksum: e95db92f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:45 ; elapsed = 00:00:19 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6425 ; free virtual = 261782default:defaulth px� 
H
3Phase 1 Placer Initialization | Checksum: e95db92f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:45 ; elapsed = 00:00:19 . Memory (MB): peak = 3287.172 ; gain = 16.008 ; free physical = 6425 ; free virtual = 261782default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
2
%s*constraints2
 2default:defaulth px� 
D
/Phase 2 Global Placement | Checksum: 1e6a85e45
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:36 ; elapsed = 00:00:41 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6995 ; free virtual = 267252default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1e6a85e45
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:37 ; elapsed = 00:00:42 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6995 ; free virtual = 267252default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 12f8d6633
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:58 ; elapsed = 00:00:48 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267252default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 159dda3f7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:58 ; elapsed = 00:00:49 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267252default:defaulth px� 
x

Phase %s%s
101*constraints2
3.4 2default:default2)
updateClock Trees: DP2default:defaultZ18-101h px� 
K
6Phase 3.4 updateClock Trees: DP | Checksum: 159dda3f7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:58 ; elapsed = 00:00:49 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267252default:defaulth px� 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px� 
J
5Phase 3.5 Timing Path Optimizer | Checksum: b3131c29
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:04 ; elapsed = 00:00:50 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267252default:defaulth px� 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
F
1Phase 3.6 Fast Optimization | Checksum: ed9a0e09
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:05 ; elapsed = 00:00:51 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6996 ; free virtual = 267242default:defaulth px� 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
3.7.1 2default:default26
"Commit Small Macros and Core Logic2default:defaultZ18-101h px� 
|

Phase %s%s
101*constraints2
3.7.1.1 2default:default2)
Commit Slice Clusters2default:defaultZ18-101h px� 
O
:Phase 3.7.1.1 Commit Slice Clusters | Checksum: 1586c17c0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:16 ; elapsed = 00:01:00 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
Z
EPhase 3.7.1 Commit Small Macros and Core Logic | Checksum: 1586c17c0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:16 ; elapsed = 00:01:01 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
�

Phase %s%s
101*constraints2
3.7.2 2default:default2C
/Clock Restriction Legalization for Leaf Columns2default:defaultZ18-101h px� 
g
RPhase 3.7.2 Clock Restriction Legalization for Leaf Columns | Checksum: 1586c17c0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:17 ; elapsed = 00:01:01 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
�

Phase %s%s
101*constraints2
3.7.3 2default:default2E
1Clock Restriction Legalization for Non-Clock Pins2default:defaultZ18-101h px� 
i
TPhase 3.7.3 Clock Restriction Legalization for Non-Clock Pins | Checksum: 1586c17c0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:17 ; elapsed = 00:01:02 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
R
=Phase 3.7 Small Shape Detail Placement | Checksum: 1586c17c0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:17 ; elapsed = 00:01:02 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.8 Re-assign LUT pins | Checksum: 21ad3d321
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:18 ; elapsed = 00:01:03 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 21ad3d321
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:18 ; elapsed = 00:01:03 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
~

Phase %s%s
101*constraints2
4.1.1 2default:default2-
callUpdateTimingBeforePCO2default:defaultZ18-101h px� 
Q
<Phase 4.1.1 callUpdateTimingBeforePCO | Checksum: 217eb83e0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:35 ; elapsed = 00:01:07 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
}

Phase %s%s
101*constraints2
4.1.2 2default:default2,
updateClock Trees: PCOPT2default:defaultZ18-101h px� 
P
;Phase 4.1.2 updateClock Trees: PCOPT | Checksum: 217eb83e0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:35 ; elapsed = 00:01:07 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
�

Phase %s%s
101*constraints2
4.1.3 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
z

Phase %s%s
101*constraints2
4.1.3.1 2default:default2'
PCOPT Shape updates2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2

4.1.3.1.1 2default:default2/
removeOptionalFFsFromShapes2default:defaultZ18-101h px� 
W
BPhase 4.1.3.1.1 removeOptionalFFsFromShapes | Checksum: 217eb83e0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:36 ; elapsed = 00:01:07 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
z

Phase %s%s
101*constraints2

4.1.3.1.2 2default:default2%
deleteLutnmShapes2default:defaultZ18-101h px� 
w

Phase %s%s
101*constraints2 
4.1.3.1.2.1 2default:default2 
deleteShapes2default:defaultZ18-101h px� 
J
5Phase 4.1.3.1.2.1 deleteShapes | Checksum: 1cc526922
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:36 ; elapsed = 00:01:07 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
M
8Phase 4.1.3.1.2 deleteLutnmShapes | Checksum: 1cc526922
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:36 ; elapsed = 00:01:08 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
M
8Phase 4.1.3.1 PCOPT Shape updates | Checksum: 1cc526922
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:36 ; elapsed = 00:01:08 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6997 ; free virtual = 267222default:defaulth px� 
�

Phase %s%s
101*constraints2
4.1.3.2 2default:default26
"Post Placement Timing Optimization2default:defaultZ18-101h px� 


Phase %s%s
101*constraints2

4.1.3.2.1 2default:default2*
Restore Best Placement2default:defaultZ18-101h px� 
R
=Phase 4.1.3.2.1 Restore Best Placement | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:45 ; elapsed = 00:01:17 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6991 ; free virtual = 267232default:defaulth px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-0.0562default:defaultZ30-746h px� 
\
GPhase 4.1.3.2 Post Placement Timing Optimization | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:46 ; elapsed = 00:01:17 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6991 ; free virtual = 267232default:defaulth px� 
S
>Phase 4.1.3 Post Placement Optimization | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:46 ; elapsed = 00:01:18 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6991 ; free virtual = 267232default:defaulth px� 
N
9Phase 4.1 Post Commit Optimization | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:46 ; elapsed = 00:01:18 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6988 ; free virtual = 267232default:defaulth px� 
�

Phase %s%s
101*constraints2
4.2 2default:default25
!Sweep Clock Roots: Post-Placement2default:defaultZ18-101h px� 
W
BPhase 4.2 Sweep Clock Roots: Post-Placement | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:47 ; elapsed = 00:01:18 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6988 ; free virtual = 267232default:defaulth px� 
y

Phase %s%s
101*constraints2
4.3 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.3 Post Placement Cleanup | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:47 ; elapsed = 00:01:18 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6988 ; free virtual = 267232default:defaulth px� 
s

Phase %s%s
101*constraints2
4.4 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
4.4.1 2default:default2
Restore STA2default:defaultZ18-101h px� 
C
.Phase 4.4.1 Restore STA | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:47 ; elapsed = 00:01:19 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6987 ; free virtual = 267232default:defaulth px� 
F
1Phase 4.4 Placer Reporting | Checksum: 1b8d4beb8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:47 ; elapsed = 00:01:19 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6987 ; free virtual = 267232default:defaulth px� 
z

Phase %s%s
101*constraints2
4.5 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
M
8Phase 4.5 Final Placement Cleanup | Checksum: 20f86361d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:48 ; elapsed = 00:01:19 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6987 ; free virtual = 267232default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 20f86361d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:48 ; elapsed = 00:01:19 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6992 ; free virtual = 267212default:defaulth px� 
>
)Ending Placer Task | Checksum: 18317b5c8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:48 ; elapsed = 00:01:19 . Memory (MB): peak = 3327.191 ; gain = 56.027 ; free physical = 6992 ; free virtual = 267212default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
652default:default2
762default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:02:522default:default2
00:01:222default:default2
3327.1912default:default2
56.0272default:default2
69932default:default2
267222default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:072default:default2
00:00:022default:default2
3327.1912default:default2
0.0002default:default2
68272default:default2
267122default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:122default:default2
00:00:062default:default2
3327.1912default:default2
0.0002default:default2
66042default:default2
266132default:defaultZ17-722h px� 
�
�report_io: Time (s): cpu = 00:00:00.21 ; elapsed = 00:00:00.26 . Memory (MB): peak = 3327.191 ; gain = 0.000 ; free physical = 6586 ; free virtual = 26609
*commonh px� 
�
�report_utilization: Time (s): cpu = 00:00:00.28 ; elapsed = 00:00:00.33 . Memory (MB): peak = 3327.191 ; gain = 0.000 ; free physical = 6568 ; free virtual = 26608
*commonh px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.17 ; elapsed = 00:00:00.21 . Memory (MB): peak = 3327.191 ; gain = 0.000 ; free physical = 6557 ; free virtual = 26603
*commonh px� 


End Record