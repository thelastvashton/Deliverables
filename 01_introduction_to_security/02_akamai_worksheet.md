Cybersecurity Threat Landscape (Part 2 - Akamai)
In this part, you should primarily use the Akamai_Security_Year_in_Review_2019 and Akamai State of the Internet/ Security plus independent research to answer the below questions.
______________________________________________________________________
1.	DDOS attack events from January 2019 to September 2019 largely targeted which industry?
If you’re looking at events, not unique targets, the gaming industry had the most attack events. They had far more than any industry.

2.	Almost 50% of unique targets for DDoS attacks from January 2019- September 2019 largely targeted which industry?

Financial Services was largely targeted when looking at unique targets for DDoS attacks.

3.	Which companies are the top phishing targets, according to Akamai?

The companies that are the top phishing targets are typically technology companies, and they specifically named Microsoft, PayPal, DHL, Dropbox, DocuSign, and LinkedIn.

4.	What is credential stuffing?

Credential stuffing involves taking credentials from website breach dumps and running them against many websites, searching for matches that are attributed to credential reuse.

5.	Which country is the number one source of credential abuse attacks? Which country is number 2?

The first is the United States and followed by Russia for credential abuse.

6.	Which country is the number one source of web application attacks? Which country is number 2?

More of the same, the first is the United States and followed by Russia for web application attacks.

7.	In Akamai’s State of the Internet report, it refers to a possible DDoS team that the company thought was affecting a customer in Asia (starts on page 11).
-	Describe what was happening.
-	What did the team believe the source of the attack was?
-	What did the team actually discover?

There was an Akamai customer that was receiving so much traffic to one of their URLs, that the server where Akamai kept those relevant logs almost crashed. The incident looked like a DDoS attack. The Akamai SOCC focused on returning their customer’s operations back to normal while their SIRT tried to establish the cause of the incident. They started noticing patterns in the traffic that led them to conclude that the traffic wasn’t malicious and most likely inadvertent. Basically, there was no attempt to mask visits to the URL even after being blocked. It was confirmed to be a warranty tool from a vendor their customer worked with that was causing all this traffic.

8.	What is an example of a performance issue with bot traffic?

The examples given in this document are slow websites and frustrated customers.

9.	Known-good bots are bots that perform useful or helpful tasks, and not do anything malicious to sites or servers. What are the main categories of known-good bots.

Known-good bots include search engine crawlers, web archives, SEO / Audience Analytics / Marketing Service, Site Monitoring Services, and Content Aggregators -basically anything that helps the right users get to your page or performs a common good for the sake of the internet.

10.	What are two evasion techniques that malicious bots use?

IP Spoofing and Altered HTTP header values, even better if you mimic a whitelisted fingerprint.





References

Credential stuffing Software Attack | OWASP Foundation
Credential stuffing Software Attack | OWASP Foundation. (2021). Retrieved 13 June 2021, from https://owasp.org/www-community/attacks/Credential_stuffing

The Component Object Model - Win32 apps
The Component Object Model - Win32 apps. (2018). Retrieved 13 June 2021, from https://docs.microsoft.com/en-us/windows/win32/com/the-component-object-model

User-Agent - HTTP | MDN
User-Agent - HTTP | MDN. (2021). Retrieved 13 June 2021, from https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent
