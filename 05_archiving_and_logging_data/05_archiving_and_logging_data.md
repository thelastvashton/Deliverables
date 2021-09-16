## Week 5 Homework Submission File: Archiving and Logging Data

I threw my submission file in a Google doc so it was easier to keep track of my answers. Let me know if it’s preferable to leave it in the original format.

### Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1. Command to **extract** the `TarDocs.tar` archive to the current directory:
sysadmin@UbuntuDesktop:~/Projects$ tar xf TarDocs.tar

2. Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directory:
sysadmin@UbuntuDesktop:~/Projects/TarDocs/Documents$ tar --exclude='Java' -cvf Javaless_Docs.tar *

3. Command to ensure `Java/` is not in the new `Javaless_Docs.tar` archive:
sysadmin@UbuntuDesktop:~/Projects/TarDocs/Documents$ tar --list --verbose --file=Javaless_Docs.tar

I ended up using the above because ls -l was being annoying and this way I was only listing what was in Javaless_Docs.tar.

**Bonus**
- Command to create an incremental archive called `logs_backup_tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory:
sysadmin@UbuntuDesktop:/$ sudo tar -czfg logs_backup_tar.gz var/log/snapshot.file

c for compress, f which equates to --file=ARCHIVE, g is for new GNU incremental backup format, and z is for Gzip compression to get the .gz extension, the name of the compressed file, and the target files for compression.

#### Critical Analysis Question

- Why wouldn't you use the options `-x` and `-c` at the same time with `tar`?
 c is for creating compressed files and x is to extract them, they are like a double-negative in that sense.


### Step 2: Create, Manage, and Automate Cron Jobs

1. Cron job for backing up the `/var/log/auth.log` file:
sysadmin@UbuntuDesktop:/$ crontab -e
0 6 * * 3 sudo tar czf auth_backup.tgz /var/log/auth.log
sysadmin@UbuntuDesktop:/$ sudo service cron restart


### Step 3: Write Basic Bash Scripts

1. Brace expansion command to create the four subdirectories:
sysadmin@UbuntuDesktop:/$ mkdir ~/backups
sysadmin@UbuntuDesktop:/$ sudo nano create_directories.sh
#!/bin/bash
mkdir ~/backups/{freemem,diskuse,openlist,freedisk}
sysadmin@UbuntuDesktop:/$ bash create_directories.sh

2. Paste your `system.sh` script edits below:
First, I created each text document in their respective directory.
sysadmin@UbuntuDesktop:/$ touch ~/backups/freemem/free_mem.txt
sysadmin@UbuntuDesktop:/$ touch ~/backups/diskuse/disk_usage.txt
sysadmin@UbuntuDesktop:/$ touch ~/backups/openlist/open_list.txt
sysadmin@UbuntuDesktop:/$ touch ~/backups/freedisk/free_disk.txt
sysadmin@UbuntuDesktop:/$ sudo nano system.sh
free -h >> ~/backups/freemem/free_mem.txt
du -h >> ~/backups/diskuse/disk_usage.txt
lsof >> ~/backups/openlist/open_list.txt
df -h >> ~/backups/freedisk/free_disk.txt

3. Command to make the `system.sh` script executable:
sysadmin@UbuntuDesktop:~$ sudo chmod 755 system.sh

**Optional**
- Commands to test the script and confirm its execution:
sysadmin@UbuntuDesktop:~$ bash -x system.sh

**Bonus**
- Command to copy `system` to system-wide cron directory:
sysadmin@UbuntuDesktop:/etc$ sudo cp system.sh /etc/cron.weekly

However, it may be necessary to change the location of the backup directory and its contents. Right now, the script is intended to be run as sysadmin and the backups directory is in sysadmin's home directory.
---

### Step 4. Manage Log File Sizes

1. Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file.

    Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.
sysadmin@UbuntuDesktop:/$ sudo nano /etc/logrotate.conf
/var/log/auth.log {
weekly
rotate 7
notifempty
delaycompress
missingok
}

### Bonus: Check for Policy and File Violations

1. Command to verify `auditd` is active:
sysadmin@UbuntuDesktop:~$ service auditd status

2. Command to set number of retained logs and maximum log file size:
sysadmin@UbuntuDesktop:/$ sudo nano /etc/audit/auditd.conf
...
max_log_file = 35
num_logs = 7
...

3. Command using `auditd` to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:
sysadmin@UbuntuDesktop:/$ sudo nano /etc/audit/rules.d/audit.rules
## Set wra permissions rule for /etc/shadow w/ hashpass_audit set keyname
-w /etc/shadow -p war -k hashpass_audit
## Set wra permissions rule for /etc/passwd w/ userpass_audit set keyname
-w /etc/passwd -p war -k userpass_audit
## Set wra permissions rule for /var/log/auth.log w/ authlog_audit set keyname
-w /var/log/auth.log -p war -k authlog_audit

4. Command to restart `auditd`:
sysadmin@UbuntuDesktop:/$ service auditd restart

5. Command to list all `auditd` rules:
sysadmin@UbuntuDesktop:/$ sudo auditctl -l
[sudo] password for sysadmin:
-w /etc/shadow -p rwa -k hashpass_audit
-w /etc/passwd -p rwa -k userpass_audit
-w /var/log/auth.log -p rwa -k authlog_audit

6. Command to produce an audit report:
sysadmin@UbuntuDesktop:/$ sudo aureport -au

7. Create a user with `sudo useradd attacker` and produce an audit report that lists account modifications:
sysadmin@UbuntuDesktop:/$ sudo aureport -m

8. Command to use `auditd` to watch `/var/log/cron`:
sysadmin@UbuntuDesktop:~$ sudo nano /etc/audit/rules.d/audit.rules
-w /var/log/cron -p war

9. Command to verify `auditd` rules:
sysadmin@UbuntuDesktop:~$ service auditd restart
sysadmin@UbuntuDesktop:~$ sudo auditctl -l

### Bonus (Research Activity): Perform Various Log Filtering Techniques

1. Command to return `journalctl` messages with priorities from emergency to error:
sysadmin@UbuntuDesktop:~$ journalctl -p 0..3

1. Command to check the disk usage of the system journal unit since the most recent boot:
sysadmin@UbuntuDesktop:~$ journalctl --disk-usage

1. Comand to remove all archived journal files except the most recent two:
sysadmin@UbuntuDesktop:~$ sudo journalctl --vacuum-files=2

1. Command to filter all log messages with priority levels between zero and two, and save output to `/home/sysadmin/Priority_High.txt`:
sysadmin@UbuntuDesktop:~$ sudo journalctl -p 0..2 >/home/sysadmin/Priority_High.txt

1. Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:
sysadmin@UbuntuDesktop:~$ sudo crontab -e
@daily sudo journalctl --system -p 0..2 >/home/sysadmin/Priority_High.txt
