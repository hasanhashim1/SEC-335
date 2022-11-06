# Lab 8.1 - Weevely💡

Webshells like simple-backdoor.php are effective but are not terribly stealthy. Basic IDS/IPS systems will be able to detect "shell-like" behavior by seeing content that looks like commands, prompts and sensitive files like /etc/passwd.

Wireshark Capture of traditional webshellTarget pippin with a traditional webshell (one without encryption or obfuscation). Capture a dump of /etc/passwd using Wireshark on your wg0 interface.



## Deliverable 1. Provide a screenshot that shows the relevant tcp stream similar to the one below. Create a capture filter on port 80 when you do so.

![Capture](C:\Users\Hasan Hashim\OneDrive\Desktop\champlain\SEC-335\Week8\images\Capture.PNG)



`curl 'http://10.0.5.25/upload/navarro.php?cmd=cat+/etc/passwd'`
