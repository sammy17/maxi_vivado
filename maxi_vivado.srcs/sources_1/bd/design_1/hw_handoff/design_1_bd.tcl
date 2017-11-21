
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART xilinx.com:zc702:part0:1.2 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {4} \
 ] $axi_mem_intercon

  # Create instance: backsub_0, and set properties
  set backsub_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:backsub:1.0 backsub_0 ]

  # Create instance: backsub_0_bram, and set properties
  set backsub_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 backsub_0_bram ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Read_Width_A {16} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Use_RSTB_Pin {false} \
CONFIG.Write_Depth_A {76800} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $backsub_0_bram

  # Create instance: feature_0, and set properties
  set feature_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:feature:1.0 feature_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_USE_DEFAULT_ACP_USER_VAL {1} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_HIGH_OCM {1} \
CONFIG.PCW_USE_S_AXI_ACP {1} \
CONFIG.preset {ZC702} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {4} \
 ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {15} \
CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {31} \
CONFIG.CONST_WIDTH {5} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_ACP]
  connect_bd_intf_net -intf_net backsub_0_frame_PORTA [get_bd_intf_pins backsub_0/frame_PORTA] [get_bd_intf_pins backsub_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net backsub_0_frame_PORTB [get_bd_intf_pins backsub_0/frame_PORTB] [get_bd_intf_pins backsub_0_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net backsub_0_m_axi_gmem [get_bd_intf_pins axi_mem_intercon/S02_AXI] [get_bd_intf_pins backsub_0/m_axi_gmem]
  connect_bd_intf_net -intf_net backsub_0_m_axi_gmem_offset [get_bd_intf_pins axi_mem_intercon/S03_AXI] [get_bd_intf_pins backsub_0/m_axi_gmem_offset]
  connect_bd_intf_net -intf_net feature_0_m_axi_CRTL_BUS [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins feature_0/m_axi_CRTL_BUS]
  connect_bd_intf_net -intf_net feature_0_m_axi_gmem [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins feature_0/m_axi_gmem]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins feature_0/s_axi_AXILiteS] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins feature_0/s_axi_CRTL_BUS] [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins backsub_0/s_axi_AXILiteS] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins backsub_0/s_axi_CRTL_BUS] [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI]

  # Create port connections
  connect_bd_net -net backsub_0_interrupt [get_bd_pins backsub_0/interrupt] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net feature_0_interrupt [get_bd_pins feature_0/interrupt] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_mem_intercon/S03_ACLK] [get_bd_pins backsub_0/ap_clk] [get_bd_pins feature_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_ACP_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_mem_intercon/S03_ARESETN] [get_bd_pins backsub_0/ap_rst_n] [get_bd_pins feature_0/ap_rst_n] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins processing_system7_0/S_AXI_ACP_ARCACHE] [get_bd_pins processing_system7_0/S_AXI_ACP_AWCACHE] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins processing_system7_0/S_AXI_ACP_ARUSER] [get_bd_pins processing_system7_0/S_AXI_ACP_AWUSER] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces backsub_0/Data_m_axi_gmem] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces backsub_0/Data_m_axi_gmem_offset] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces backsub_0/Data_m_axi_gmem] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_HIGH_OCM] SEG_processing_system7_0_ACP_HIGH_OCM
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces backsub_0/Data_m_axi_gmem_offset] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_HIGH_OCM] SEG_processing_system7_0_ACP_HIGH_OCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces feature_0/Data_m_axi_gmem] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces feature_0/Data_m_axi_CRTL_BUS] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_DDR_LOWOCM] SEG_processing_system7_0_ACP_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces feature_0/Data_m_axi_gmem] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_HIGH_OCM] SEG_processing_system7_0_ACP_HIGH_OCM
  create_bd_addr_seg -range 0x40000 -offset 0xFFFC0000 [get_bd_addr_spaces feature_0/Data_m_axi_CRTL_BUS] [get_bd_addr_segs processing_system7_0/S_AXI_ACP/ACP_HIGH_OCM] SEG_processing_system7_0_ACP_HIGH_OCM
  create_bd_addr_seg -range 0x10000 -offset 0x43C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs backsub_0/s_axi_AXILiteS/Reg] SEG_backsub_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs backsub_0/s_axi_CRTL_BUS/Reg] SEG_backsub_0_Reg1
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs feature_0/s_axi_AXILiteS/Reg] SEG_feature_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs feature_0/s_axi_CRTL_BUS/Reg] SEG_feature_0_Reg1

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
#  -string -flagsOSRD
preplace port DDR -pg 1 -y -100 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y -80 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 2 -y 300 -defaultsOSRD
preplace inst rst_processing_system7_0_100M -pg 1 -lvl 4 -y 210 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 2 -y 550 -defaultsOSRD
preplace inst backsub_0_bram -pg 1 -lvl 2 -y 30 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 2 -y 170 -defaultsOSRD
preplace inst feature_0 -pg 1 -lvl 2 -y -170 -defaultsOSRD
preplace inst backsub_0 -pg 1 -lvl 1 -y 0 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 5 -y -180 -defaultsOSRD
preplace inst processing_system7_0_axi_periph -pg 1 -lvl 5 -y 250 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 3 -y -20 -defaultsOSRD
preplace netloc processing_system7_0_DDR 1 3 3 NJ -100 NJ 40 NJ
preplace netloc xlconstant_1_dout 1 2 1 840
preplace netloc processing_system7_0_axi_periph_M03_AXI 1 0 6 -40 -90 NJ -80 NJ -150 NJ -150 NJ 70 2100
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 1 5 370 -410 NJ -410 NJ -410 NJ -410 2130
preplace netloc processing_system7_0_M_AXI_GP0 1 3 2 NJ -40 NJ
preplace netloc feature_0_m_axi_gmem 1 2 3 790 -330 NJ -330 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 3 1 1320
preplace netloc backsub_0_m_axi_gmem 1 1 4 340 -290 NJ -290 NJ -290 NJ
preplace netloc axi_mem_intercon_M00_AXI 1 2 4 820 -170 NJ -170 NJ 30 NJ
preplace netloc processing_system7_0_axi_periph_M02_AXI 1 0 6 -50 -100 NJ -90 NJ -160 NJ -160 NJ 60 2110
preplace netloc rst_processing_system7_0_100M_peripheral_aresetn 1 0 5 -70 -140 360 -250 NJ -250 NJ -250 1760
preplace netloc feature_0_m_axi_CRTL_BUS 1 2 3 800 -310 NJ -310 NJ
preplace netloc xlconstant_0_dout 1 2 1 820
preplace netloc xlconcat_0_dout 1 2 1 830
preplace netloc feature_0_interrupt 1 1 2 380 -60 780
preplace netloc backsub_0_m_axi_gmem_offset 1 1 4 350 -270 NJ -270 NJ -270 NJ
preplace netloc backsub_0_frame_PORTA 1 1 1 370
preplace netloc processing_system7_0_FIXED_IO 1 3 3 NJ -80 NJ 50 NJ
preplace netloc backsub_0_frame_PORTB 1 1 1 360
preplace netloc rst_processing_system7_0_100M_interconnect_aresetn 1 4 1 1770
preplace netloc processing_system7_0_FCLK_CLK0 1 0 5 -60 -110 380 -70 810 -190 1330 -190 1800
preplace netloc processing_system7_0_axi_periph_M01_AXI 1 1 5 380 -390 NJ -390 NJ -390 NJ -390 2120
preplace netloc backsub_0_interrupt 1 1 1 340
levelinfo -pg 1 -90 150 590 1080 1550 1950 2170 -top -430 -bot 600
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


