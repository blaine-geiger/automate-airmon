<h1>Automate airmon-ng</h1>

<h2>Description</h2>
This script project automates many of the lines of code and configuration needed to activate a Wi-Fi adapter in Kali Linux and cause it to enter Wi-Fi monitoring (passive sniffing). This includes assigning the interface, killing other processes  
that may interfere, bringing the interface down and changing the MAC address of the interface to a random MAC (obfuscation), bringing the interface back up, running a check to ensure the interface is in monitor mode,  
and prompting the user for input to confirm the initiation of airmon-ng. If we are in monitor mode and we run airmon-ng, we are now passively sniffing Wi-Fi traffic. Nearby Wi-FI Access Points will be revealed. We can even discover the names (SSIDs) of hidden APs  
by simply waiting for new devices to join them (association) or through other "active attacks" (deauthentication).
<br />


<h2>Languages and Utilities</h2>

- <b>Bash</b>
- <b>PowerShell</b> 

<h2>Environments Used </h2>

- <b>Kali Linux</b>

<h2>Script Usage</h2>

<p>Simply save the script in Mousepad or another text editor in Kali Linux. Then open a terminal. There is no need for a root terminal because the script contains the 'sudo' commands where they are
  needed. Navigate to the directory where the script has been saved and type <b><i>chmod +x start_airmon.sh</i></b>  which will make the script executable. Now, in the same terminal window type <b><i>./start_airmon.sh</i></b></p>



<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
