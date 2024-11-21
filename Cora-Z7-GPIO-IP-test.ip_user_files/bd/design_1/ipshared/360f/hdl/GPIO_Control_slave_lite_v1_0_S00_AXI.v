
`timescale 1 ns / 1 ps

module GPIO_Control_slave_lite_v1_0_S00_AXI #(


    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH = 4,

    parameter LED_WIDTH = 8,
    parameter SWITCH_WIDTH = 8
) (
    // Users to add ports here

    output [LED_WIDTH-1:0] leds,
    input [SWITCH_WIDTH-1:0] switches,


    // Axi Slave Interface Signals

    // Global Clock Signal
    input wire S_AXI_ACLK,
    input wire S_AXI_ARESETN,

    // Slave Interface Write Address Ports

    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    input wire [2 : 0] S_AXI_AWPROT,
    input wire S_AXI_AWVALID,
    output wire S_AXI_AWREADY,

    // Slave Interface Write Data Ports

    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    input wire S_AXI_WVALID,
    output wire S_AXI_WREADY,

    // Slave Interface Write Response Ports
    output wire [1 : 0] S_AXI_BRESP,
    output wire S_AXI_BVALID,
    input wire S_AXI_BREADY,

    // Slave Interface Read Address Ports
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    input wire [2 : 0] S_AXI_ARPROT,
    input wire S_AXI_ARVALID,
    output wire S_AXI_ARREADY,

    // Slave Interface Read Data Ports

    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    output wire [1 : 0] S_AXI_RRESP,
    output wire S_AXI_RVALID,
    input wire S_AXI_RREADY
    //--- end of Axi Slave interface signals 
);

  // AXI4LITE signals
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
  reg axi_awready;
  reg axi_wready;
  reg [1 : 0] axi_bresp;
  reg axi_bvalid;
  reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
  reg axi_arready;
  reg [1 : 0] axi_rresp;
  reg axi_rvalid;

 
  localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH / 32) + 1;
  localparam integer OPT_MEM_ADDR_BITS = 1;
  //----------------------------------------------
  //-- Signals for user logic register space example
  //------------------------------------------------
  //-- Number of Slave Registers 4
  reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg0;
  reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg1;
  reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg2;
  reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg3;
  integer byte_index;

  // I/O Connections assignments
  assign leds = slv_reg0;

  assign S_AXI_AWREADY = axi_awready;
  assign S_AXI_WREADY = axi_wready;
  assign S_AXI_BRESP = axi_bresp;
  assign S_AXI_BVALID = axi_bvalid;
  assign S_AXI_ARREADY = axi_arready;
  assign S_AXI_RRESP = axi_rresp;
  assign S_AXI_RVALID = axi_rvalid;
  //state machine varibles 
  reg [1:0] state_write;
  reg [1:0] state_read;
  //State machine local parameters
  localparam Idle = 2'b00, Raddr = 2'b10, Rdata = 2'b11, Waddr = 2'b10, Wdata = 2'b11;
  // Implement Write state machine
  // Outstanding write transactions are not supported by the slave i.e., master should assert bready to receive response on or before it starts sending the new transaction
  always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0) begin
      axi_awready <= 0;
      axi_wready  <= 0;
      axi_bvalid  <= 0;
      axi_bresp   <= 0;
      axi_awaddr  <= 0;
      state_write <= Idle;
    end else begin
      case (state_write)
        Idle: begin
          if (S_AXI_ARESETN == 1'b1) begin
            axi_awready <= 1'b1;
            axi_wready  <= 1'b1;
            state_write <= Waddr;
          end else state_write <= state_write;
        end
        Waddr:        //At this state, slave is ready to receive address along with corresponding control signals and first data packet. Response valid is also handled at this state                                 
	             begin
          if (S_AXI_AWVALID && S_AXI_AWREADY) begin
            axi_awaddr <= S_AXI_AWADDR;
            if (S_AXI_WVALID) begin
              axi_awready <= 1'b1;
              state_write <= Waddr;
              axi_bvalid  <= 1'b1;
            end else begin
              axi_awready <= 1'b0;
              state_write <= Wdata;
              if (S_AXI_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
            end
          end else begin
            state_write <= state_write;
            if (S_AXI_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
          end
        end
        Wdata:        //At this state, slave is ready to receive the data packets until the number of transfers is equal to burst length                                 
	             begin
          if (S_AXI_WVALID) begin
            state_write <= Waddr;
            axi_bvalid  <= 1'b1;
            axi_awready <= 1'b1;
          end else begin
            state_write <= state_write;
            if (S_AXI_BREADY && axi_bvalid) axi_bvalid <= 1'b0;
          end
        end
      endcase
    end
  end
 

  always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0) begin
      slv_reg0 <= 0;
      slv_reg2 <= 0;
      slv_reg3 <= 0;
    end else begin

      if (S_AXI_WVALID) begin
        case ( (S_AXI_AWVALID) ? S_AXI_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] : axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
          2'h0:
          for (
              byte_index = 0;
              byte_index <= (C_S_AXI_DATA_WIDTH / 8) - 1;
              byte_index = byte_index + 1
          )
            if (S_AXI_WSTRB[byte_index] == 1) begin
              // Respective byte enables are asserted as per write strobes 
              // Slave register 0
              slv_reg0[(byte_index*8)+:8] <= S_AXI_WDATA[(byte_index*8)+:8];
            end

          2'h2:
          for (
              byte_index = 0;
              byte_index <= (C_S_AXI_DATA_WIDTH / 8) - 1;
              byte_index = byte_index + 1
          )
            if (S_AXI_WSTRB[byte_index] == 1) begin
              // Respective byte enables are asserted as per write strobes 
              // Slave register 2
              slv_reg2[(byte_index*8)+:8] <= S_AXI_WDATA[(byte_index*8)+:8];
            end
          2'h3:
          for (
              byte_index = 0;
              byte_index <= (C_S_AXI_DATA_WIDTH / 8) - 1;
              byte_index = byte_index + 1
          )
            if (S_AXI_WSTRB[byte_index] == 1) begin
              // Respective byte enables are asserted as per write strobes 
              // Slave register 3
              slv_reg3[(byte_index*8)+:8] <= S_AXI_WDATA[(byte_index*8)+:8];
            end
          default: begin
            slv_reg0 <= slv_reg0;
            slv_reg2 <= slv_reg2;
            slv_reg3 <= slv_reg3;
          end
        endcase
      end
    end
  end
  // new always block 

  always @(posedge S_AXI_ACLK) begin

    if (S_AXI_ARESETN == 1'b0) begin

      slv_reg1 <= 0;

    end else begin
      slv_reg1 <= switches;

    end
  end

  // Implement read state machine
  always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0) begin
      //asserting initial values to all 0's during reset                                       
      axi_arready <= 1'b0;
      axi_rvalid  <= 1'b0;
      axi_rresp   <= 1'b0;
      state_read  <= Idle;
    end else begin
      case (state_read)
        Idle:     //Initial state inidicating reset is done and ready to receive read/write transactions                                       
	              begin
          if (S_AXI_ARESETN == 1'b1) begin
            state_read  <= Raddr;
            axi_arready <= 1'b1;
          end else state_read <= state_read;
        end
        Raddr:        //At this state, slave is ready to receive address along with corresponding control signals                                       
	              begin
          if (S_AXI_ARVALID && S_AXI_ARREADY) begin
            state_read  <= Rdata;
            axi_araddr  <= S_AXI_ARADDR;
            axi_rvalid  <= 1'b1;
            axi_arready <= 1'b0;
          end else state_read <= state_read;
        end
        Rdata:        //At this state, slave is ready to send the data packets until the number of transfers is equal to burst length                                       
	              begin
          if (S_AXI_RVALID && S_AXI_RREADY) begin
            axi_rvalid  <= 1'b0;
            axi_arready <= 1'b1;
            state_read  <= Raddr;
          end else state_read <= state_read;
        end
      endcase
    end
  end
  // Implement memory mapped register select and read logic generation
  assign S_AXI_RDATA = (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 2'h0) ? slv_reg0 : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 2'h1) ? slv_reg1 : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 2'h2) ? slv_reg2 : (axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 2'h3) ? slv_reg3 :0;
  // Add user logic here

  // User logic ends

endmodule
