vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/sim/ila_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

