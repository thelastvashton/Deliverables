Security 101 Homework: Security Reporting
Part I: Symantec
For Part 1 of your homework assignment, you should primarily use the Symantec Internet Security Threat Report along with independent research to answer the following questions.
________________________________________
1.	What is formjacking?
Formjacking is a term for the practice of lifting user-supplied data from JavaScript website forms and sending it to a third-party server under control of the attacker. It’s a newer (possibly coined by Symantec?) term for what’s considered web skimming. I can’t believe they’re trying to make fetch happen.

2.	How many websites are compromised each month with formjacking code?

According to the big font on the 7th page of this Symantec report, there is a monthly average of 4,800 websites compromised with formjacking code each month. Then on the 14th page, a reported 4,818 unique websites were compromised. I’ve read the fine print and the large, bold print.

3.	What is Powershell?

Windows PowerShell is developed by Microsoft and performs as a task automation and configuration manager, functionally a command-line interface for administrative tasks.

4.	What was the annual percentage increase in malicious Powershell scripts?

Page 11 and 17 of the report state that malicious PowerShell scripts increased by 1000%.

5.	What is a coinminer?

Coinminers are applications that can be run in order to provide computing power to a cryptocurrency network. Their use is incentivized because the cryptocurrency network offers some small amount of whatever cryptocurrency being exchanged on that network.

6.	How much can data from a single credit card can be sold for?

Depending on the quality of the credit card data, whether it has full details, or is a dump of the magnetic strip from physical skimming, prices vary. A single credit card can cost $0.50-$20, a card with full details can cost $1-$45, and a magnetic strip dump can range from $5-$60. This data is from page 58 of the Symantec report.

7.	How did Magecart successfully attack Ticketmaster?
Magecart compromised Ticketmaster specifically through a third-party chatbot. So in this instance, users’ web browsers were loaded with malicious code not by compromising Ticketmaster directly, but compromising a third-party service that Ticketmaster utilized.
8.	What is one reason why there has been a growth of formjacking?
This report attributes the drop in cryptocurrency value during 2018, but it’s probably more accurate to say that card data is a more stable and effective form of theft. The cyrptocurrency market has a lot of variables, credit card data has a limited number of variables. Card skimmers on gas pumps and other skimming means were effective ways to skim in the real world, and the pronounced use of formjacking brings that same effectiveness to the online marketplace which has grown a lot in a short matter of time.

9.	Cryptojacking dropped by what percentage between January and December 2018?

Cryptojacking dropped by 52% according to page 15 of this report.

10.	If a web page contains a coinmining script, what happens?

Web pages containing coinmining scripts will use the visiting devices’ resources for cryptomining for the duration that page is open. With browsers becoming much more resource-intensive, these sites can take advantage of less knowledgeable users easily.

11.	How does an exploit kit work?

Exploit kits are basically bundles of exploits put into a single tool. They can eliminate the need for knowledge of vulnerabilities and their exploits. It’s not unusual for an exploit kit to scan for vulnerabilities, determine the correct exploit, deliver it, and then download and run malware. They make it easy to combine exploits with a malware of choice.

12.	What does the criminal group SamSam specialize in?

This report documents that the group SamSam has performed targeted ransomeware attacks on organizations; Page 16.

13.	How many SamSam attacks did Symantec find evidence of in 2018?

In 2018, they found 67 SamSam attacks; page 16.

14.	Even though ransomware attacks declined in 2017-2018, what was one dramatic change that occurred?

Consumers were the most common victims of ransomeware attacks up until 2017. Then, enterprises became the most targeted. In 2018, that shift accelerated and enterprises accounted for 81 percent of all ransomware infections. While overall ransomware infections were down, enterprise infections were up by 12 percent in 2018.

15.	In 2018, what was the primary ransomware distribution method?

Ransomeware began being primarily distributed through emails.

16.	What operating systems do most types of ransomware attacks still target?

Microsoft Windows is the operating system that is still the most targeted.

17.	What are “living off the land” attacks? What is the advantage to hackers?
[Looks like you missed answering this one] These are attacks in which hackers use tools that are already installed on the victim’s computers, instead of using other outside tools.
17.
By using these native tools, hackers can more easily hide their activity amidst the legitimate processes occurring on a victim’s computer. And even if the malicious activity is identified, it is harder to attribute and identify the specific attacks and attackers.

18.	What is an example of a tool that’s used in “living off the land” attacks?

Living off the land attacks are exactly what they sound like; they’re attacks that utilize existent features of the target system to facilitate the attack. An example would be executing a malicious PowerShell script on Microsoft Windows.

19.	What are zero-day exploits?

Zero-day exploits are vulnerabilities that are unknown to the software’s developers. EternalBlue is an example of a zero-day. They are zero-day in the sense that they’ve literally had zero time to patch the vulnerability. These are attacks that occur on the same day that a vulnerability is found in software. The vulnerability can therefore be exploited before a patch has been developed to fix it.

20.	By what percentage did zero-day exploits decline in 2018?

It’s not that zero-day exploits declined in 2018, it’s that their usage by attack groups declined from 27% in 2017 to 23% in 2018.

21.	What are two techniques that worms such as Emotet and Qakbot use?

These worms spread over networks by dumping passwords from memory or brute-forcing access to devices on the network, moving laterally.

22.	What are supply chain attacks? By how much did they increase in 2018?

They increased by 78% in 2018. They’re attacks that utilize third-party tools or services to compromise the intended target.

23.	What challenge do supply chain attacks and living off the land attacks highlight for organizations?

The challenge is that these attacks are propagated through channels of trust. If it were an analogy it’d be: Committing a crime while obeying traffic laws.

24.	The 20 most active groups tracked by Symantec targeted an average of how many organizations between 2016 and 2018?

They attacked an average of 55 organizations.
25.	How many individuals or organizations were indicted for cyber criminal activities in 2018? What are some of the countries that these entities were from?

The US indicted 49 individuals/organizations consisting of nationals from Russia, China, Iran, and North Korea.

26.	When it comes to the increased number of cloud cybersecurity attacks, what is the common theme?

The commonality lies in poor configuration of cloud databases, not following best practices.

27.	What is the implication for successful cloud exploitation that provides access to memory locations that are normally forbidden?

If this vulnerability is exploited on machines supporting cloud instances, not only is the specific cloud instance that was infiltrated become compromised, but all the instances that run off that memory pool. [And shared resources right?]

28.	What are two examples of the above cloud attack?

Meltdown and Spectre are perhaps the most infamous chip-level vulnerabilities, having a huge impact on the Cloud frontier.

29.	Regarding Internet of Things (IoT) attacks, what were the two most common infected devices and what percentage of IoT attacks were attributed to them?

Routers and IP cameras were the most infected with 75% and 15% respectively.

30.	What is the Mirai worm and what does it do?

Mirai is a DDoS worm that targets IoT things.

31.	Why was Mirai the third most common IoT threat in 2018?

Mirai remained an active threat in 2018 because of the persistent addition of new exploits and expansion of targeted devices (even unpatched Linux servers) in combination with an abundance of unpatched IoT devices.

32.	What was unique about VPNFilter with regards to IoT threats?

There seems to be a lot unique about VPNFilter in that it was the first IoT threat to remain persistent, surviving reboots. While typical IoT threats up to that point were DDoS and coin mining, VPNFilter could handle man in the middle attacks, data theft, even intercepting SCADA system communications. It can also self-destruct.

33.	What type of attack targeted the Democratic National Committee in 2019?

It was an unsuccessful spear-phishing attack.

34.	What were 48% of  malicious email attachments in 2018?

Those would be Office file attachments.

35.	What were the top two malicious email themes in 2018?

The top email themes were bills (15.7%) and email delivery failures (13.3%).

36.	What was the top malicious email attachment type in 2018?

That would be .doc, or .dot with 37%.

37.	Which country had the highest email phishing rate? Which country had the lowest email phishing rate?

Saudi Arabia had 1 in every 675 and Poland had 1 in every 9,653.

38.	What is Emotet and how much did it jump in 2018?

Emotet is categorized as a financial trojan and self-propagating Emotet jumped up to 26% from 4% in 2017.

39.	What was the top malware threat of the year? How many of those attacks were blocked?

The top malware threat for the year in question is named Heur.AdvML.C, making up 52% of attacks with 43,999,373 attacks blocked.

40.	Malware primarily attacks which type of operating system?

Malware primarily attacks Microsoft Windows devices, making up almost the entire market share.

41.	What was the top coinminer of 2018 and how many of those attacks were blocked?

The top coinminer was JS.Webcoinminer, making up 49.7% or 2,768,721 attacks blocked.


42.	What were the top three financial Trojans of 2018?

The top three financial trojans for 2018 were Ramnit, Zbot, and Emotet.

43.	What was the most common avenue of attack in 2018?

Among targeted attack groups, spear-phishing emails were the most popular avenue for attack, with their use comprising 65% of all known groups.

44.	What is destructive malware? By what percent did these attacks increase in 2018?

Destructive malware is a family of malware used in the destroying of data often as a means of extortion and/or rendering the system inoperable. 8% of groups were using it in 2018, whereas only 6% of groups were using it at the end of 2017.

45.	What was the top user name used in IoT attacks?

The top username used in IoT attacks was root, followed by admin.

46.	What was the top password used in IoT attacks?

The top password was 123456, followed by a blank field.

47.	What were the top three protocols used in IoT attacks? What were the top two ports used in IoT attacks?

The top three protocols attacked were Telnet, http, and https.

48.	In the underground economy, how much can someone get for the following?

a.	Stolen or fake identity: $0.10-$1.50
b.	Stolen medical records: $0.10-$35
c.	Hacker for hire: $100+
d.	Single credit card with full details: $1-$45
e.	500 social media followers: $2-$6
 


References & Links:

Snyder. (2020). Formjacking: What Is It, and How Can You Protect Your Users?. Retrieved 13 June 2021, from https://edtechmagazine.com/higher/article/2019/09/formjacking-what-it-and-how-can-you-protect-your-users

What is PowerShell? - PowerShell. (2021). Retrieved 13 June 2021, from https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.1

Macro malware - Windows security. (2021). Retrieved 13 June 2021, from https://docs.microsoft.com/en-us/windows/security/threat-protection/intelligence/macro-malware#:~:text=Macro%20malware%20hides%20in%20Microsoft,%2C%20legal%20documents%2C%20and%20more

Watch out for card skimming at the gas pump. (2018). Retrieved 18 June 2021, from https://www.consumer.ftc.gov/blog/2018/08/watch-out-card-skimming-gas-pump

Emotet Malware | CISA. (2021). Retrieved 18 June 2021, from https://us-cert.cisa.gov/ncas/alerts/TA18-201A

VPNFilter Destructive Malware | CISA. (2021). Retrieved 18 June 2021, from https://us-cert.cisa.gov/ncas/current-activity/2018/05/23/VPNFilter-Destructive-Malware
