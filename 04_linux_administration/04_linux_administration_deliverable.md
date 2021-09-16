## Week 4 Homework Submission File: Linux Systems Administration

### Step 1: Ensure/Double Check Permissions on Sensitive Files

1. Permissions on `/etc/shadow` should allow only `root` read and write access.
    - Command to inspect permissions:
sysadmin@UbuntuDesktop:/etc$ sudo ls -l shadow
    - Command to set permissions (if needed):
sysadmin@UbuntuDesktop:/etc$ sudo chmod 600 shadow

2. Permissions on `/etc/gshadow` should allow only `root` read and write access.
    - Command to inspect permissions:
sysadmin@UbuntuDesktop:/etc$ ls -l gshadow
    - Command to set permissions (if needed):
sysadmin@UbuntuDesktop:/etc$ sudo chmod 600 gshadow

3. Permissions on `/etc/group` should allow `root` read and write access, and allow everyone else read access only.
    - Command to inspect permissions:
sysadmin@UbuntuDesktop:/etc$ sudo ls -l group
    - Command to set permissions (if needed):
sysadmin@UbuntuDesktop:/etc$ sudo chmod 644 group

4. Permissions on `/etc/passwd` should allow `root` read and write access, and allow everyone else read access only.
    - Command to inspect permissions:
sysadmin@UbuntuDesktop:/etc$ sudo ls -l passwd
    - Command to set permissions (if needed):
sysadmin@UbuntuDesktop:/etc$ sudo chmod 644 passwd

### Step 2: Create User Accounts

1. Add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.
    - Command to add each user account (include all five users):
sysadmin@UbuntuDesktop:/$ sudo adduser sam --ingroup engineers
sysadmin@UbuntuDesktop:/$ sudo adduser joe --ingroup engineers
sysadmin@UbuntuDesktop:/$ sudo adduser amy --ingroup engineers
sysadmin@UbuntuDesktop:/$ sudo adduser sara --ingroup engineers
sysadmin@UbuntuDesktop:/$ sudo adduser admin –ingroup sudo

I did that a little differently than I was probably supposed to. For the engineer users, I created the group first, then used sudo adduser [username] –ingroup engineers in order to cut down on the number of commands that I was typing.

2. Ensure that only the `admin` has general sudo access.
    - Command to add `admin` to the `sudo` group:
sysadmin@UbuntuDesktop:/$ sudo adduser admin sudo

That’s the command I would have used if I hadn’t put admin in the sudo group while I was creating the user.

### Step 3: Create User Group and Collaborative Folder

1. Add an `engineers` group to the system.
    - Command to add group:
	sysadmin@UbuntuDesktop:/$ sudo addgroup engineers

2. Add users `sam`, `joe`, `amy`, and `sara` to the managed group.
  - Command to add users to `engineers` group (include all four users):
	sysadmin@UbuntuDesktop:/$ sudo adduser sam engineers
	sysadmin@UbuntuDesktop:/$ sudo adduser joe engineers
	sysadmin@UbuntuDesktop:/$ sudo adduser amy engineers
	sysadmin@UbuntuDesktop:/$ sudo adduser sara engineers

These are the commands that I ended up typing regardless of my attempt to not do so previously.

3. Create a shared folder for this group at `/home/engineers`.
    - Command to create the shared folder:
sysadmin@UbuntuDesktop:/$ sudo mkdir /home/engineers

4. Change ownership on the new engineers' shared folder to the `engineers` group.
    - Command to change ownership of engineer's shared folder to engineer group:
sysadmin@UbuntuDesktop:/home$sudo chown -R root:engineers /home/engineers
sysadmin@UbuntuDesktop:/home$ sudo chmod -R 770 /home/engineers

I just assumed we were talking about assigning group ownership, and then I just set group permissions to be read, write, and execute to meet the privileges root, as the owner, has. Also, I guess I could have used chgrp, but I decided to make this entire portion more complicated than it was supposed to be anyways.

### Step 4: Lynis Auditing

1.	Command to install Lynis:
sysadmin@UbuntuDesktop:/$ sudo apt install lynis
-In reality, I had to use the following process because Ubuntu didn't seem to know the current location of the Lynis keyserver: https://packages.cisofy.com/community/#debian-ubuntu

2.	Command to see documentation and instructions:
sysadmin@UbuntuDesktop:/$ man lynis

3.	Command to run an audit:
sysadmin@UbuntuDesktop:/$ sudo lynis audit system
-At least, that’s the command to run an audit on the local system.

4. Provide a report from the Lynis output on what can be done to harden the system.

I put the output from Lynis into a text document to provide the entirety of the report. To summarize the warnings and suggestions:

Warnings: It wants me to reboot and is indicating that there may be information disclosure occurring over SMTP.

Suggestions: The suggestions consist of disabling items, drivers, services, protocols, etc. that may not be necessary, checking credentials and configuration, limiting sensitive items to root-only access, adding packages/patches, and partitioning to protect the kernel.

-Screenshot of report output:


### Bonus
1.	Command to install chkrootkit:
sysadmin@UbuntuDesktop:/$ sudo apt-get install chkrootkit

2.	Command to see documentation and instructions:
sysadmin@UbuntuDesktop:/$ man chkrootkit

3.	Command to run expert mode:
sysadmin@UbuntuDesktop:/$ sudo chkrootkit -x [test]

4. Provide a report from the chrootkit output on what can be done to harden the system.

When I saw the output of the first chkrootkit test without any options in the command, I found it overwhelming. So after some research, I decided to run chkrootkit in quiet mode. I put the full output of a full, regular chkrootkit test in one text document and one in quiet mode into another. The last page contains the resources that I used to learn about utilizing chkrootkit. As far as I understand, quiet mode will only show files chkrootkit found suspect. Regarding the quiet mode output, I learned that a lot of these files were flagged due to beginning with a period. Those were flagged because chkrootkit interprets items beginning with a dot to be conspicuous hidden files. So, there will be false positives from any legitimate items that begin with a dot. Also, files beginning with exclamation points are flagged because they correlate with users that aren’t logged in currently. That’s not necessarily bad, it just means that admins should take a look to make sure that they recognize those items. From running chkrootkit and Lynis I primarily learned that keeping systems patched and being familiar with the items on those systems is vital and will make using these tools the most effective.


    - Screenshot of end of sample output:



 
References:
How to use the chkrootkit command. Linux Tips. (2020). Retrieved 14 July 2021, from https://techplanet.today/post/how-to-use-the-chkrootkit-command-linux-tips

(2021). Retrieved 14 July 2021, from https://www.linuxjournal.com/sites/default/files/2018-11/GeekGuide-HelpSystems-SelfAudit-2.pdf
