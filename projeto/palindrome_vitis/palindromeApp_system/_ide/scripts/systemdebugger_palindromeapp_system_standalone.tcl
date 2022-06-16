# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\User\Dropbox\Project_CR\projeto\palindrome_vitis\palindromeApp_system\_ide\scripts\systemdebugger_palindromeapp_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\User\Dropbox\Project_CR\projeto\palindrome_vitis\palindromeApp_system\_ide\scripts\systemdebugger_palindromeapp_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274504951A" && level==0 && jtag_device_ctx=="jsn-Nexys4-210274504951A-13631093-0"}
fpga -file C:/Users/User/Dropbox/Project_CR/projeto/palindrome_vitis/palindromeApp/_ide/bitstream/download.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/User/Dropbox/Project_CR/projeto/palindrome_vitis/mb_design_palindrome/export/mb_design_palindrome/hw/mb_design_palindrome.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/User/Dropbox/Project_CR/projeto/palindrome_vitis/palindromeApp/Debug/palindromeApp.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
