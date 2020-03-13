vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xilinx_vip -64 -sv -L xil_defaultlib "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L xil_defaultlib "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/sim/ila_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

