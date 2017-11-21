// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:backsub:1.0
// IP Revision: 1711210112

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
design_1_backsub_0_0 your_instance_name (
  .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),            // input wire [5 : 0] s_axi_AXILiteS_AWADDR
  .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),          // input wire s_axi_AXILiteS_AWVALID
  .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),          // output wire s_axi_AXILiteS_AWREADY
  .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),              // input wire [31 : 0] s_axi_AXILiteS_WDATA
  .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),              // input wire [3 : 0] s_axi_AXILiteS_WSTRB
  .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),            // input wire s_axi_AXILiteS_WVALID
  .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),            // output wire s_axi_AXILiteS_WREADY
  .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),              // output wire [1 : 0] s_axi_AXILiteS_BRESP
  .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),            // output wire s_axi_AXILiteS_BVALID
  .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),            // input wire s_axi_AXILiteS_BREADY
  .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),            // input wire [5 : 0] s_axi_AXILiteS_ARADDR
  .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),          // input wire s_axi_AXILiteS_ARVALID
  .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),          // output wire s_axi_AXILiteS_ARREADY
  .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),              // output wire [31 : 0] s_axi_AXILiteS_RDATA
  .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),              // output wire [1 : 0] s_axi_AXILiteS_RRESP
  .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),            // output wire s_axi_AXILiteS_RVALID
  .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),            // input wire s_axi_AXILiteS_RREADY
  .s_axi_CRTL_BUS_AWADDR(s_axi_CRTL_BUS_AWADDR),            // input wire [5 : 0] s_axi_CRTL_BUS_AWADDR
  .s_axi_CRTL_BUS_AWVALID(s_axi_CRTL_BUS_AWVALID),          // input wire s_axi_CRTL_BUS_AWVALID
  .s_axi_CRTL_BUS_AWREADY(s_axi_CRTL_BUS_AWREADY),          // output wire s_axi_CRTL_BUS_AWREADY
  .s_axi_CRTL_BUS_WDATA(s_axi_CRTL_BUS_WDATA),              // input wire [31 : 0] s_axi_CRTL_BUS_WDATA
  .s_axi_CRTL_BUS_WSTRB(s_axi_CRTL_BUS_WSTRB),              // input wire [3 : 0] s_axi_CRTL_BUS_WSTRB
  .s_axi_CRTL_BUS_WVALID(s_axi_CRTL_BUS_WVALID),            // input wire s_axi_CRTL_BUS_WVALID
  .s_axi_CRTL_BUS_WREADY(s_axi_CRTL_BUS_WREADY),            // output wire s_axi_CRTL_BUS_WREADY
  .s_axi_CRTL_BUS_BRESP(s_axi_CRTL_BUS_BRESP),              // output wire [1 : 0] s_axi_CRTL_BUS_BRESP
  .s_axi_CRTL_BUS_BVALID(s_axi_CRTL_BUS_BVALID),            // output wire s_axi_CRTL_BUS_BVALID
  .s_axi_CRTL_BUS_BREADY(s_axi_CRTL_BUS_BREADY),            // input wire s_axi_CRTL_BUS_BREADY
  .s_axi_CRTL_BUS_ARADDR(s_axi_CRTL_BUS_ARADDR),            // input wire [5 : 0] s_axi_CRTL_BUS_ARADDR
  .s_axi_CRTL_BUS_ARVALID(s_axi_CRTL_BUS_ARVALID),          // input wire s_axi_CRTL_BUS_ARVALID
  .s_axi_CRTL_BUS_ARREADY(s_axi_CRTL_BUS_ARREADY),          // output wire s_axi_CRTL_BUS_ARREADY
  .s_axi_CRTL_BUS_RDATA(s_axi_CRTL_BUS_RDATA),              // output wire [31 : 0] s_axi_CRTL_BUS_RDATA
  .s_axi_CRTL_BUS_RRESP(s_axi_CRTL_BUS_RRESP),              // output wire [1 : 0] s_axi_CRTL_BUS_RRESP
  .s_axi_CRTL_BUS_RVALID(s_axi_CRTL_BUS_RVALID),            // output wire s_axi_CRTL_BUS_RVALID
  .s_axi_CRTL_BUS_RREADY(s_axi_CRTL_BUS_RREADY),            // input wire s_axi_CRTL_BUS_RREADY
  .ap_clk(ap_clk),                                          // input wire ap_clk
  .ap_rst_n(ap_rst_n),                                      // input wire ap_rst_n
  .interrupt(interrupt),                                    // output wire interrupt
  .m_axi_gmem_AWADDR(m_axi_gmem_AWADDR),                    // output wire [31 : 0] m_axi_gmem_AWADDR
  .m_axi_gmem_AWLEN(m_axi_gmem_AWLEN),                      // output wire [7 : 0] m_axi_gmem_AWLEN
  .m_axi_gmem_AWSIZE(m_axi_gmem_AWSIZE),                    // output wire [2 : 0] m_axi_gmem_AWSIZE
  .m_axi_gmem_AWBURST(m_axi_gmem_AWBURST),                  // output wire [1 : 0] m_axi_gmem_AWBURST
  .m_axi_gmem_AWLOCK(m_axi_gmem_AWLOCK),                    // output wire [1 : 0] m_axi_gmem_AWLOCK
  .m_axi_gmem_AWREGION(m_axi_gmem_AWREGION),                // output wire [3 : 0] m_axi_gmem_AWREGION
  .m_axi_gmem_AWCACHE(m_axi_gmem_AWCACHE),                  // output wire [3 : 0] m_axi_gmem_AWCACHE
  .m_axi_gmem_AWPROT(m_axi_gmem_AWPROT),                    // output wire [2 : 0] m_axi_gmem_AWPROT
  .m_axi_gmem_AWQOS(m_axi_gmem_AWQOS),                      // output wire [3 : 0] m_axi_gmem_AWQOS
  .m_axi_gmem_AWVALID(m_axi_gmem_AWVALID),                  // output wire m_axi_gmem_AWVALID
  .m_axi_gmem_AWREADY(m_axi_gmem_AWREADY),                  // input wire m_axi_gmem_AWREADY
  .m_axi_gmem_WDATA(m_axi_gmem_WDATA),                      // output wire [31 : 0] m_axi_gmem_WDATA
  .m_axi_gmem_WSTRB(m_axi_gmem_WSTRB),                      // output wire [3 : 0] m_axi_gmem_WSTRB
  .m_axi_gmem_WLAST(m_axi_gmem_WLAST),                      // output wire m_axi_gmem_WLAST
  .m_axi_gmem_WVALID(m_axi_gmem_WVALID),                    // output wire m_axi_gmem_WVALID
  .m_axi_gmem_WREADY(m_axi_gmem_WREADY),                    // input wire m_axi_gmem_WREADY
  .m_axi_gmem_BRESP(m_axi_gmem_BRESP),                      // input wire [1 : 0] m_axi_gmem_BRESP
  .m_axi_gmem_BVALID(m_axi_gmem_BVALID),                    // input wire m_axi_gmem_BVALID
  .m_axi_gmem_BREADY(m_axi_gmem_BREADY),                    // output wire m_axi_gmem_BREADY
  .m_axi_gmem_ARADDR(m_axi_gmem_ARADDR),                    // output wire [31 : 0] m_axi_gmem_ARADDR
  .m_axi_gmem_ARLEN(m_axi_gmem_ARLEN),                      // output wire [7 : 0] m_axi_gmem_ARLEN
  .m_axi_gmem_ARSIZE(m_axi_gmem_ARSIZE),                    // output wire [2 : 0] m_axi_gmem_ARSIZE
  .m_axi_gmem_ARBURST(m_axi_gmem_ARBURST),                  // output wire [1 : 0] m_axi_gmem_ARBURST
  .m_axi_gmem_ARLOCK(m_axi_gmem_ARLOCK),                    // output wire [1 : 0] m_axi_gmem_ARLOCK
  .m_axi_gmem_ARREGION(m_axi_gmem_ARREGION),                // output wire [3 : 0] m_axi_gmem_ARREGION
  .m_axi_gmem_ARCACHE(m_axi_gmem_ARCACHE),                  // output wire [3 : 0] m_axi_gmem_ARCACHE
  .m_axi_gmem_ARPROT(m_axi_gmem_ARPROT),                    // output wire [2 : 0] m_axi_gmem_ARPROT
  .m_axi_gmem_ARQOS(m_axi_gmem_ARQOS),                      // output wire [3 : 0] m_axi_gmem_ARQOS
  .m_axi_gmem_ARVALID(m_axi_gmem_ARVALID),                  // output wire m_axi_gmem_ARVALID
  .m_axi_gmem_ARREADY(m_axi_gmem_ARREADY),                  // input wire m_axi_gmem_ARREADY
  .m_axi_gmem_RDATA(m_axi_gmem_RDATA),                      // input wire [31 : 0] m_axi_gmem_RDATA
  .m_axi_gmem_RRESP(m_axi_gmem_RRESP),                      // input wire [1 : 0] m_axi_gmem_RRESP
  .m_axi_gmem_RLAST(m_axi_gmem_RLAST),                      // input wire m_axi_gmem_RLAST
  .m_axi_gmem_RVALID(m_axi_gmem_RVALID),                    // input wire m_axi_gmem_RVALID
  .m_axi_gmem_RREADY(m_axi_gmem_RREADY),                    // output wire m_axi_gmem_RREADY
  .m_axi_gmem_offset_AWADDR(m_axi_gmem_offset_AWADDR),      // output wire [31 : 0] m_axi_gmem_offset_AWADDR
  .m_axi_gmem_offset_AWLEN(m_axi_gmem_offset_AWLEN),        // output wire [7 : 0] m_axi_gmem_offset_AWLEN
  .m_axi_gmem_offset_AWSIZE(m_axi_gmem_offset_AWSIZE),      // output wire [2 : 0] m_axi_gmem_offset_AWSIZE
  .m_axi_gmem_offset_AWBURST(m_axi_gmem_offset_AWBURST),    // output wire [1 : 0] m_axi_gmem_offset_AWBURST
  .m_axi_gmem_offset_AWLOCK(m_axi_gmem_offset_AWLOCK),      // output wire [1 : 0] m_axi_gmem_offset_AWLOCK
  .m_axi_gmem_offset_AWREGION(m_axi_gmem_offset_AWREGION),  // output wire [3 : 0] m_axi_gmem_offset_AWREGION
  .m_axi_gmem_offset_AWCACHE(m_axi_gmem_offset_AWCACHE),    // output wire [3 : 0] m_axi_gmem_offset_AWCACHE
  .m_axi_gmem_offset_AWPROT(m_axi_gmem_offset_AWPROT),      // output wire [2 : 0] m_axi_gmem_offset_AWPROT
  .m_axi_gmem_offset_AWQOS(m_axi_gmem_offset_AWQOS),        // output wire [3 : 0] m_axi_gmem_offset_AWQOS
  .m_axi_gmem_offset_AWVALID(m_axi_gmem_offset_AWVALID),    // output wire m_axi_gmem_offset_AWVALID
  .m_axi_gmem_offset_AWREADY(m_axi_gmem_offset_AWREADY),    // input wire m_axi_gmem_offset_AWREADY
  .m_axi_gmem_offset_WDATA(m_axi_gmem_offset_WDATA),        // output wire [31 : 0] m_axi_gmem_offset_WDATA
  .m_axi_gmem_offset_WSTRB(m_axi_gmem_offset_WSTRB),        // output wire [3 : 0] m_axi_gmem_offset_WSTRB
  .m_axi_gmem_offset_WLAST(m_axi_gmem_offset_WLAST),        // output wire m_axi_gmem_offset_WLAST
  .m_axi_gmem_offset_WVALID(m_axi_gmem_offset_WVALID),      // output wire m_axi_gmem_offset_WVALID
  .m_axi_gmem_offset_WREADY(m_axi_gmem_offset_WREADY),      // input wire m_axi_gmem_offset_WREADY
  .m_axi_gmem_offset_BRESP(m_axi_gmem_offset_BRESP),        // input wire [1 : 0] m_axi_gmem_offset_BRESP
  .m_axi_gmem_offset_BVALID(m_axi_gmem_offset_BVALID),      // input wire m_axi_gmem_offset_BVALID
  .m_axi_gmem_offset_BREADY(m_axi_gmem_offset_BREADY),      // output wire m_axi_gmem_offset_BREADY
  .m_axi_gmem_offset_ARADDR(m_axi_gmem_offset_ARADDR),      // output wire [31 : 0] m_axi_gmem_offset_ARADDR
  .m_axi_gmem_offset_ARLEN(m_axi_gmem_offset_ARLEN),        // output wire [7 : 0] m_axi_gmem_offset_ARLEN
  .m_axi_gmem_offset_ARSIZE(m_axi_gmem_offset_ARSIZE),      // output wire [2 : 0] m_axi_gmem_offset_ARSIZE
  .m_axi_gmem_offset_ARBURST(m_axi_gmem_offset_ARBURST),    // output wire [1 : 0] m_axi_gmem_offset_ARBURST
  .m_axi_gmem_offset_ARLOCK(m_axi_gmem_offset_ARLOCK),      // output wire [1 : 0] m_axi_gmem_offset_ARLOCK
  .m_axi_gmem_offset_ARREGION(m_axi_gmem_offset_ARREGION),  // output wire [3 : 0] m_axi_gmem_offset_ARREGION
  .m_axi_gmem_offset_ARCACHE(m_axi_gmem_offset_ARCACHE),    // output wire [3 : 0] m_axi_gmem_offset_ARCACHE
  .m_axi_gmem_offset_ARPROT(m_axi_gmem_offset_ARPROT),      // output wire [2 : 0] m_axi_gmem_offset_ARPROT
  .m_axi_gmem_offset_ARQOS(m_axi_gmem_offset_ARQOS),        // output wire [3 : 0] m_axi_gmem_offset_ARQOS
  .m_axi_gmem_offset_ARVALID(m_axi_gmem_offset_ARVALID),    // output wire m_axi_gmem_offset_ARVALID
  .m_axi_gmem_offset_ARREADY(m_axi_gmem_offset_ARREADY),    // input wire m_axi_gmem_offset_ARREADY
  .m_axi_gmem_offset_RDATA(m_axi_gmem_offset_RDATA),        // input wire [31 : 0] m_axi_gmem_offset_RDATA
  .m_axi_gmem_offset_RRESP(m_axi_gmem_offset_RRESP),        // input wire [1 : 0] m_axi_gmem_offset_RRESP
  .m_axi_gmem_offset_RLAST(m_axi_gmem_offset_RLAST),        // input wire m_axi_gmem_offset_RLAST
  .m_axi_gmem_offset_RVALID(m_axi_gmem_offset_RVALID),      // input wire m_axi_gmem_offset_RVALID
  .m_axi_gmem_offset_RREADY(m_axi_gmem_offset_RREADY),      // output wire m_axi_gmem_offset_RREADY
  .frame_Clk_A(frame_Clk_A),                                // output wire frame_Clk_A
  .frame_Rst_A(frame_Rst_A),                                // output wire frame_Rst_A
  .frame_EN_A(frame_EN_A),                                  // output wire frame_EN_A
  .frame_WEN_A(frame_WEN_A),                                // output wire [1 : 0] frame_WEN_A
  .frame_Addr_A(frame_Addr_A),                              // output wire [31 : 0] frame_Addr_A
  .frame_Din_A(frame_Din_A),                                // output wire [15 : 0] frame_Din_A
  .frame_Dout_A(frame_Dout_A),                              // input wire [15 : 0] frame_Dout_A
  .frame_Clk_B(frame_Clk_B),                                // output wire frame_Clk_B
  .frame_Rst_B(frame_Rst_B),                                // output wire frame_Rst_B
  .frame_EN_B(frame_EN_B),                                  // output wire frame_EN_B
  .frame_WEN_B(frame_WEN_B),                                // output wire [1 : 0] frame_WEN_B
  .frame_Addr_B(frame_Addr_B),                              // output wire [31 : 0] frame_Addr_B
  .frame_Din_B(frame_Din_B),                                // output wire [15 : 0] frame_Din_B
  .frame_Dout_B(frame_Dout_B)                              // input wire [15 : 0] frame_Dout_B
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file design_1_backsub_0_0.v when simulating
// the core, design_1_backsub_0_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

