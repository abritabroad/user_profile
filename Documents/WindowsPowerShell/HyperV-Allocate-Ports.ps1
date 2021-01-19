
# Display Currently Allocated
# ---------------------------

netsh interface ipv4 show excludedportrange protocol=tcp

# Disable Hyper-V
# ---------------

dism.exe /Online /Disable-Feature:Microsoft-Hyper-V

# Allocate Required ports
# -----------------------

netsh int ipv4 add excludedportrange protocol=tcp startport=3000 numberofports=2
netsh int ipv4 add excludedportrange protocol=tcp startport=6942 numberofports=50
netsh int ipv4 add excludedportrange protocol=tcp startport=8080 numberofports=1

# Enable Hyper-V
# ---------------

dism.exe /Online /Enable-Feature:Microsoft-Hyper-V

