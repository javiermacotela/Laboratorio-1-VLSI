# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Javier/Documents/Embedded electronics/Introduction to structured VLSI design/Laboratorios/Laboratorio 1/Sequences/Sequences.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Javier/Documents/Embedded electronics/Introduction to structured VLSI design/Laboratorios/Laboratorio 1/Sequences/Sequences.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/Javier/Documents/Embedded electronics/Introduction to structured VLSI design/Laboratorios/Laboratorio 1/Archivos/file_read.vhd}
  {C:/Users/Javier/Documents/Embedded electronics/Introduction to structured VLSI design/Laboratorios/Laboratorio 1/Archivos/clockgenerator.vhd}
  {C:/Users/Javier/Documents/Embedded electronics/Introduction to structured VLSI design/Laboratorios/Laboratorio 1/Archivos/FSM_test.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top test -part xc7a100tcsg324-1


write_checkpoint -force -noxdef test.dcp

catch { report_utilization -file test_utilization_synth.rpt -pb test_utilization_synth.pb }
