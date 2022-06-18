# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\Raquel\Desktop\Project_CR\projeto\palindrome_vitis_v3\mb_design_palindrome_v3\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\Raquel\Desktop\Project_CR\projeto\palindrome_vitis_v3\mb_design_palindrome_v3\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mb_design_palindrome_v3}\
-hw {C:\Users\Raquel\Desktop\Project_CR\projeto\palindrome\mb_design_palindrome_v3.xsa}\
-fsbl-target {psu_cortexa53_0} -out {C:/Users/Raquel/Desktop/Project_CR/projeto/palindrome_vitis_v3}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {mb_design_palindrome_v3}
platform generate -quick
platform generate
platform clean
platform clean
platform generate
platform clean
platform generate
bsp reload
