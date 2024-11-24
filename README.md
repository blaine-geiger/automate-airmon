# Automating airmon-ng

<!--[Here is the script](https://github.com/blaine-geiger/automate-airmon/blob/3ad9ea8e4f90689b05adba1e046b33a0443ecb06/start_airmon.sh)-->

## Description
This script project automates many of the steps needed to configure a Wi-Fi adapter in Kali Linux for passive Wi-Fi sniffing (monitor mode = airmon-ng) using the aircrack-ng suite.  

Key Features:
- Finding and printing all wireless available interfaces for the user
- Inquiring the user for which interface they would like to place into monitor mode
- Killing other processes that may interfere or disrupt monitor mode
- Bringing the interface down to enable MAC address changes
- Changing the interface MAC address (using macchanger) to a random MAC value (obfuscation)
- Bringing the interface back up and starting monitor mode
- Running a check to verify the interface is in monitor mode
- Prompting the user for input to confirm and initiate passive sniffing with airodump-ng

Once we are in monitor mode (airmon-ng). If we run (airodump-ng), we begin passively capturing Wi-Fi traffic from nearby networks. Wi-Fi Access Points within range and their associated devices will be revealed. By monitoring associations, even hidden SSIDs can be discovered.  

> Note: This script is a learning project to automate a simple but repetitive task. It sets up passive sniffing but does not cover active attacks such as deauthentication. It may expand further in the future.


## Languages and Utilities

- Bash
- Network Utilities: airmon-ng, macchanger, iwconfig, airodump-ng

## Environment

- Kali Linux

## Script Usage

Script Usage:
1. Save the Script: Open Mousepad (or another text editor) in Kali Linux, paste the script content, and save it with the filename `start_airmon.sh`.
2. Open a Terminal: Navigate to the directory where you saved the script.
3. Make the Script Executable:
 - `chmod +x start_airmon.sh`
4. Run the script: In the same terminal window, type:
 - `./start_airmon.sh`
> **Note**: There is no need to open a root terminal, because the script uses `sudo` for commnads requiring root permissions.


<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
