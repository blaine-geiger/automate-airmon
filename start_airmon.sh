#!/bin/bash

# Script to automate airmon-ng setup and enable monitor mode

# Define the interface (or add a prompt to type it in)
INTERFACE="wlan0"

# Step 1: Kill processes that may interfere with airmon-ng
echo "[*] Killing interfering processes..."
sudo airmon-ng check kill

# Step 2: Bring wlan0 interface down (de-activate) to change MAC
echo '[*] Bringing $INTERFACE down to change MAC address...'
sudo ip link set $INTERFACE down

# Step 3: Change MAC address of wlan0 to random MAC (obfuscation)
echo '[*] Changing MAC address for $INTERFACE...'
sudo macchanger -r $INTERFACE

# Step 4: Bring wlan0 interface back up (re-activate)
echo '[*] Bringing $INTERFACE back up...'
sudo ip link set $INTERFACE up

# Step 5: Start monitor mode on the interface
echo "[*] Starting monitor mode on $INTERFACE..."
sudo airmon-ng start $INTERFACE

# Step 6: Check to be sure interface is in monitor mode
echo "[*] Verifying monitor mode..."
iwconfig $INTERFACE

# Step 7: Prompt to run airodump-ng for network scanning
read -p "Do you want to start airodump-ng on the monitor interface? (y/n): " START_AIRODUMP

if [[ "START_AIRODUMP" == "y" || "START_AIRODUMP" == "y"]]; then
    # Interface doesn't change to wlan0mon, stays wlan0
    MONITOR_INTERFACE="${INTERFACE}"

echo "[*] Starting airodump-ng on $MONITOR_INTERFACE..."
    sudo airodump-ng $MONITOR_INTERFACE
else
    echo "[*] Monitor mode enabled. You can start airodump-ng manually using the interface ${INTERFACE}."
fi