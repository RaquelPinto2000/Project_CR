# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\Raquel\Desktop\Project_CR\projeto\palindrome_vitis_v2\palindrome_App_system\_ide\scripts\systemdebugger_palindrome_app_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\Raquel\Desktop\Project_CR\projeto\palindrome_vitis_v2\palindrome_App_system\_ide\scripts\systemdebugger_palindrome_app_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274505240A" && level==0 && jtag_device_ctx=="jsn-Nexys4-210274505240A-13631093-0"}
fpga -file C:/Users/Raquel/Desktop/Project_CR/projeto/palindrome_vitis_v2/palindrome_App/_ide/bitstream/mb_design_palindrome_v2.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/Raquel/Desktop/Project_CR/projeto/palindrome_vitis_v2/mb_design_palindrome_v2/export/mb_design_palindrome_v2/hw/mb_design_palindrome_v2.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/Raquel/Desktop/Project_CR/projeto/palindrome_vitis_v2/palindrome_App/Debug/palindrome_App.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
