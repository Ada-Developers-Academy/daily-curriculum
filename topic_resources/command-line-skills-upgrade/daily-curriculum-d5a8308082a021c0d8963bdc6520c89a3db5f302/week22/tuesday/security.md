Security for web devs
---------------------
*presented by Andrew Gorcester*

- Security is a big topic
- This is a from-orbit overview of security and includes some things that you definitely need to focus on and some things you can just generally keep in mind
- It's impossible for me to be comprehensive about security, especially in one talk
- Security as a discipline is hard, if not impossible, and constantly changing
- In this talk we'll mainly discuss encryption and web application security, but the problem space is much larger.
- Vulnerability (software or design flaws that open a system to attack, anywhere in the stack)
- Attack surface (the amount of code exposed to attack across the whole stack -- for instance, number of user input forms; of urls that accept user input; of different software packages, platforms or protocols in use).
- Nearly every feature increases attack surface, so useless features are all attack surface and no benefit. Most student applications combine a naturally small attack surface with few resources attackers want.
- Backdoor (either a way to bypass normal authetnication, or a deliberately planted vulnerability)

###What's at stake
####Criminals want:
- Computing resources, e.g. to mine bitcoins
- Network resources, e.g. to infect other computers or to send spam
- Financial information
- PII for identity theft
- User login credentials for access to other services
- Direct access to user systems (possibly via a compromised web service) for extortion etc.

####People interested in violating user privacy want:
- Knowledge of user activity
- Knowledge of user communications
- The ability to assume the identity of a user

####Others, for various reasons, want:
- To prevent users from using a service (denial of service)
- To destroy hardware or incur financial costs
- To create viruses that serve no purpose but to replicate
- To gain renown in the security community

###Examples of types of attacks
####Direct attacks to compromise a web application:
- Exploit a vulnerability in the platform (OS, programming language, webserver, database software, etc.)
- Exploit a vulnerability in the framework (Rails, Sinatra, Django, etc.)
- Exploit a vulnerability in the web application itself

####Indirect attacks to acquire user credentials:
- Social engineering
- Physical theft
- Physical eavesdropping
- Web traffic eavesdropping
- Exploit a vulnerability in web application that compromises the user's device
- Attack a user's device directly
- Acquire a legitimate user's credentials (social engineering, compromise of user device, compromise of other service that the user shares credentials with

###User input
- Never trust user input
- User input doesn't just mean form input -- it means the URL bar, what is included in HTTP headers, the contents of cookies, literally every communication from the user for any reason
- Data coming out of your database at any time is quite possibly "user input" because users may have put it there in the first place
- User input is so dangerous that over the years Rails has built layer upon layer of safety measures, enabled by default
- You still need to be aware of these measures so you don't circumvent them by accident
- Sinatra and other lightweight frameworks may not have all or any of these
- Basically, handle user input like you would handle a biohazard

####XSS
- This can happen in anything from user form input to the User-Agent field, displayed to the admin in analytics.
- to_json is vulnerable
- Rails partially protects against this
- but it's easy to circumvent the protection

####CSRF
- This is a special case, where it's not the user trying to trick the app, but the user being tricked.
- You must use GET and POST correctly and not confuse them for this to work
- Rails partially protects against this
- but it's easy to circumvent the protection

####Mass assignment
- See for instance http://code.tutsplus.com/tutorials/mass-assignment-rails-and-you--net-31695
- Rails 4 (only) protects against this
- but it's easy to circumvent the protection

####File names
- If the user can upload a file and specify the file name in any way, that file name needs to be scrubbed
- Much better to use a random file name, or a hash of the file contents, rather than try to sanitize the user input

####SQL injection
- This can happen even through ActiveRecord, anywhere you use a raw SQL fragment (sometimes unexpected places)
- Rails protects against this
- but it's easy to circumvent the protection

####Unprotected redirects
- Similar to CSRF, this is someone else trickign the user in their interaction with your app

####Dynamic render path
- When you have anything related to user input touching the template filename/path (open to directory traversal etc.)

####Session cookies
- session cookes are a special case because you CAN trust what you put in them is not forged (as long as your secret key is secret), because of the digest
- but, they are only signed, not encrypted, so users can read what you put in them
- they can also be recorded and replayed
- and stolen/eavesdropped and reused
- depending on how your session works, it may be possible that an attacker can hold on to a session even if the password of the account is changed

###Authentication
- User logins are complex because you need to both protect the users' data in your app and also protect the users from themselves

####Three factors
- what you know: passwords, password hashing, best practices for password handling, password recovery
- what you have: key fobs, signing keys stored on disk, etc.
- what you are: biometrics

####Password brute forcing
- remote
- local

####Password complexity requirements
- Some complexity requirements do much more harm than good
- If passwords are too complex, people write them down, often as sticky notes on their own monitors!
- There are some reasonable limits -- passwords of less than 8 characters are very easy to brute force

####Password hashing
- what is hashing?
- hashing best practices

####Password recovery
- is a minefield
- relying on emails
- "secret questions"

####Key fobs
- keys stored by you or by key company?

####Signing keys
- if SSH keys have a passphrase, they are two-factor; if not, they are single-factor

####Biometrics
- usually used as a quick and easy alternative to the above, not a replacement, in which case it necessarily only makes the system *less* secure

####Two-way authentication
- not terribly useful

###Other things you can do at the app level
- Minimize attack surface

###Encryption
- what is encryption?
- symmetric encryption
- asymmetric encryption
- ssl/tls
- ssh
- WEP/WPA
- other encryption

###Platform vulnerabilities
- OS
- Programming language
- Webserver
- Database or other third-party service
- Backups
- Logs

###Denial of Service

###Client security
- browser vulnerabilities
- browser plugins
- processes on the client other than the browser (downloaded applications, worms, etc) and implications for web app security

###Operational security for web devs
- how to protect your own computer
- how to manage passwords and keys
- social engineering + non-software components of security regimes
- open vs. closed source code benefits and drawbacks

###Recent newsworthy security issues and how to handle breaches
- Target CC# theft
- goto fail;
- Snapchat privacy leak
- password thefts
- password recovery issues e.g. at Apple and Twitter
- Heartbleed
- NSA-RSA RNG backdoor
- use Twitter invalid username exploit to illustrate why good software architecture boosts security

###Reading list:
- http://guides.rubyonrails.org/security.html
- http://arstechnica.com/security/2014/03/php-bug-allowing-site-hijacking-still-menaces-internet-22-months-on/
- http://www.zdnet.com/heartbleed-serious-openssl-zero-day-vulnerability-revealed-7000028166/
- http://codingkilledthecat.wordpress.com/2012/09/04/some-best-practices-for-web-app-authentication/
- http://valerieaurora.org/hash.html
- https://www.usenix.org/system/files/1401_08-12_mickens.pdf