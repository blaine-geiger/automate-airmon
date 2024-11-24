#!/bin/bash

# Script to automate airmon-ng setup and enable monitor mode

# Print out the wireless interfaces
# Prompt the user to enter the interface name they wish to use and set it to "INTERFACE"
sudo iwconfig
read -p "Enter the wireless interface name to use: " INTERFACE

# Run check to ensure interface exists
# Exit script an print error if interface not found
if ! ip link show "$INTERFACE" &> /dev/null; then
   echo "Error: Interface $INTERFACE not found!" >&2
   exit 1
fi

# Kill processes that may interfere with airmon-ng, usually WPA supplicant and Network Manager
echo "[*] Killing interfering processes..."
sudo airmon-ng check kill

# Bring wlan0 interface down (de-activate) to change MAC
echo "[*] Bringing $INTERFACE down to change MAC address..."
sudo ip link set $INTERFACE down

# Change MAC address of wlan0 to random MAC (obfuscation)
echo "[*] Changing MAC address for $INTERFACE..."
sudo macchanger -r $INTERFACE

# Bring wlan0 interface back up (re-activate)
echo "[*] Bringing $INTERFACE back up..."
sudo ip link set $INTERFACE up

# Start monitor mode on the interface
echo "[*] Starting monitor mode on $INTERFACE..."
sudo airmon-ng start $INTERFACE

# Check to be sure interface is in monitor mode
echo "[*] Verifying monitor mode... "
iw dev $INTERFACE info || echo "Warning: Unable to verify monitor mode."

# Prompt to run airodump-ng for network scanning
read -p "Do you want to start airodump-ng on the monitoring interface? (y/n): " START_AIRODUMP

# if the 
if [[ "$START_AIRODUMP" =~ ^[Yy]$ ]]; then
   echo "[*] Starting airodump-ng on $INTERFACE..."
   sudo airodump-ng $INTERFACE
   
else
echo "[*] Monitor mode is enabled on the device. You can start airodump-ng manually by entering \"sudo $INTERFACE airodump-ng\" using the interface ${INTERFACE}."
fi
