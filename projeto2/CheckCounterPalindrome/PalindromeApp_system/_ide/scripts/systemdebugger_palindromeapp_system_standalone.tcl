# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\Raquel\Desktop\Project_CR\projeto2\CheckCounterPalindrome\PalindromeApp_system\_ide\scripts\systemdebugger_palindromeapp_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\Raquel\Desktop\Project_CR\projeto2\CheckCounterPalindrome\PalindromeApp_system\_ide\scripts\systemdebugger_palindromeapp_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274505240A" && level==0 && jtag_device_ctx=="jsn-Nexys4-210274505240A-13631093-0"}
fpga -file C:/Users/Raquel/Desktop/Project_CR/projeto2/CheckCounterPalindrome/PalindromeApp/_ide/bitstream/mb_design_CheckCounterPalindrome.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/Raquel/Desktop/Project_CR/projeto2/CheckCounterPalindrome/mb_design_CheckCounterPalindrome/export/mb_design_CheckCounterPalindrome/hw/mb_design_CheckCounterPalindrome.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/Raquel/Desktop/Project_CR/projeto2/CheckCounterPalindrome/PalindromeApp/Debug/PalindromeApp.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con