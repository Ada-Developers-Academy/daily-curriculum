# RailsBridge

Your first Rails app!

## Setup

## Sign up for Heroku

http://heroku.com

Click the big Sign Up button
Enter your email address.
(Use the same email address for heroku, git, github, and ssh.)

Heroku will send you an activation email. Open it and click on the activation link. It will take you to the Heroku site. Enter and confirm your password. Hit Save.

## Install Heroku Toolbelt

https://toolbelt.heroku.com/

click the download link, and install.

### Verify

Type this in the terminal: `heroku version`

Expected result: `2.26.7` or higher

## SSH Key
An SSH key uniquely identifies you (and your computer) when your computer is communicating with other computers. Think of an SSH key as a fancy password

```
ssh-keygen -C student@example.com -t rsa
```
Hit enter to accept blank passphrase, then hit enter again

After key generation is complete, you'll have output that looks like this.

```
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/student/.ssh/id_rsa): 
Created directory '/Users/student/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/student/.ssh/id_rsa.
Your public key has been saved in /Users/student/.ssh/id_rsa.pub.
The key fingerprint is:
88:54:ab:77:fe:5c:c3:7s:14:37:28:8c:1d:ef:2a:8d student@example.com
```

Your brand-new public key is now stored at ~/.ssh/id_rsa.pub

If you look inside ~/.ssh/, you will notice two files with the same name: id_rsa and id_rsa.pub.

id_rsa.pub is your public key and can be shared freely.

id_rsa is your private key and must be kept secret.

If someone else gets your private key and your passphrase, then they can pretend to be you and log on to your Heroku or Github accounts and cause mischief!

## Add SSH Key to Heroku

```
heroku keys:add
```

hit enter to accept the default key file to use