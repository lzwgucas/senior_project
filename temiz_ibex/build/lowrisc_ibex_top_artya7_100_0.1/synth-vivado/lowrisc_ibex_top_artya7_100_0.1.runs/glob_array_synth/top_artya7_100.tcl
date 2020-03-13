# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_param tcl.collectionResultDisplayLimit 0
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.cache/wt [current_project]
set_property parent.project_path /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
set_property include_dirs /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado [current_fileset]
set_property verilog_define SRAM_INIT_FILE=/home/topalc/Desktop/senior_project/senior_project/sw/led/led.mem [current_fileset]
read_verilog -library xil_defaultlib -sv {
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_fpga_xilinx_shared_0/rtl/fpga/xilinx/clkgen_xil7series.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_pkg.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_alu.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_compressed_decoder.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_controller.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_core.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_cs_registers.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_decoder.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_ex_block.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_fetch_fifo.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_id_stage.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_if_stage.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_load_store_unit.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_fast.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_slow.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_pmp.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_prefetch_buffer.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_register_file_ff.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_fpga_xilinx_shared_0/rtl/fpga/xilinx/prim_clock_gating.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_fpga_xilinx_shared_0/rtl/ram_1p.sv
  /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_top_artya7_100_0.1/rtl/top_artya7_100.sv
}
read_ip -quiet /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/ila_0.xci
set_property used_in_synthesis false [get_files -all /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/synth-vivado/lowrisc_ibex_top_artya7_100_0.1.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_top_artya7_100_0.1/data/pins_artya7.xdc
set_property used_in_implementation false [get_files /home/topalc/Desktop/projeler/temiz_ibex/unmodified/build/lowrisc_ibex_top_artya7_100_0.1/src/lowrisc_ibex_top_artya7_100_0.1/data/pins_artya7.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top_artya7_100 -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_artya7_100.dcp
create_report "glob_array_synth_synth_report_utilization_0" "report_utilization -file top_artya7_100_utilization_synth.rpt -pb top_artya7_100_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
