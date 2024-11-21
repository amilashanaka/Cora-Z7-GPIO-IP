transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_18
vlib activehdl/processing_system7_vip_v1_0_20
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_3
vlib activehdl/proc_sys_reset_v5_0_15
vlib activehdl/generic_baseblocks_v2_1_2
vlib activehdl/fifo_generator_v13_2_10
vlib activehdl/axi_data_fifo_v2_1_31
vlib activehdl/axi_register_slice_v2_1_32
vlib activehdl/axi_protocol_converter_v2_1_32

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_18 activehdl/axi_vip_v1_1_18
vmap processing_system7_vip_v1_0_20 activehdl/processing_system7_vip_v1_0_20
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_3 activehdl/lib_cdc_v1_0_3
vmap proc_sys_reset_v5_0_15 activehdl/proc_sys_reset_v5_0_15
vmap generic_baseblocks_v2_1_2 activehdl/generic_baseblocks_v2_1_2
vmap fifo_generator_v13_2_10 activehdl/fifo_generator_v13_2_10
vmap axi_data_fifo_v2_1_31 activehdl/axi_data_fifo_v2_1_31
vmap axi_register_slice_v2_1_32 activehdl/axi_register_slice_v2_1_32
vmap axi_protocol_converter_v2_1_32 activehdl/axi_protocol_converter_v2_1_32

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2024.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_18  -sv2k12 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/1f8d/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_20  -sv2k12 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/ipshared/360f/hdl/GPIO_Control_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/360f/hdl/GPIO_Control.v" \
"../../../bd/design_1/ip/design_1_GPIO_Control_0_0/sim/design_1_GPIO_Control_0_0.v" \

vcom -work lib_cdc_v1_0_3 -93  \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_15 -93  \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/3a26/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_2  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_10  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10 -93  \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_31  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/2ccb/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_32  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/676c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_32  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d59d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Cora-Z7-GPIO-IP-test.gen/sources_1/bd/design_1/ipshared/d47c/hdl" "+incdir+C:/Xilinx/Vivado/2024.1/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_18 -l processing_system7_vip_v1_0_20 -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_15 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_10 -l axi_data_fifo_v2_1_31 -l axi_register_slice_v2_1_32 -l axi_protocol_converter_v2_1_32 \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

