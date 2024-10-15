# Automating airmon-ng

<!--[Here is the script](https://github.com/blaine-geiger/automate-airmon/blob/3ad9ea8e4f90689b05adba1e046b33a0443ecb06/start_airmon.sh)-->

## Description
This script project automates many of the lines of code and configuration needed to activate a Wi-Fi adapter in Kali Linux and cause it to begin passively sniffing surrounding Wi-Fi (airmon-ng).
This includes:
- Assigning the interface
- Killing other processes that may interfere
- Bringing the interface down
- Changing the MAC address (using macchanger) of the interface to a random MAC (obfuscation)
- Bringing the interface back up
- Running a check to ensure the interface is in monitor mode
- Prompting the user for input to confirm the initiation of airmon-ng
- Initiating airmon-ng for passive Wi-Fi sniffing

If we are in monitor mode and we run airmon-ng, we are now passively sniffing Wi-Fi traffic. Nearby Wi-Fi Access Points and their associated devices will be revealed. We can even discover the names (SSIDs) 
of hidden APs by simply waiting for new devices to join them (association) or through other "active attacks" (deauthentication). We won't cover those details here.

## Languages and Utilities

- Bash
- Network Utilities: airmon-ng, macchanger, iwconfig, airodump-ng

## Environment

- Kali Linux

## Script Usage

Simply save the script in Mousepad or another text editor in Kali Linux. Then open a terminal. There is no need for a root terminal because the script contains the 'sudo' commands where they are
needed. Navigate to the directory where the script has been saved and type <b><i>chmod +x start_airmon.sh</i></b>  which will make the script executable. Now, in the same terminal window type <b><i> ./start_airmon.sh</i></b>



<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
