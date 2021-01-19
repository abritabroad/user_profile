
# Display Currently Allocated
# ---------------------------

netsh interface ipv4 show excludedportrange protocol=tcp

# Disable Hyper-V
# ---------------

dism.exe /Online /Disable-Feature:Microsoft-Hyper-V

# Allocate Required ports
# -----------------------

netsh int ipv4 add excludedportrange protocol=tcp startport=3000 numberofports=2    # SPA ports
netsh int ipv4 add excludedportrange protocol=tcp startport=6942 numberofports=50   # IntelliJ server process
netsh int ipv4 add excludedportrange protocol=tcp startport=8080 numberofports=1    # API ports
netsh int ipv4 add excludedportrange protocol=tcp startport=9009 numberofports=1    # IntelliJ debugger

# Enable Hyper-V
# ---------------

dism.exe /Online /Enable-Feature:Microsoft-Hyper-V

