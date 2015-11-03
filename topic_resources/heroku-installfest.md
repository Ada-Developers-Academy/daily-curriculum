# Heroku Installfest

## Sign up for Heroku

http://heroku.com

Click the big Sign Up button
Enter your email address.
(Use the same email address for Heroku, git, github, and ssh.)

Heroku will send you an activation email. Open it and click on the activation link. It will take you to the Heroku site. Enter and confirm your password. Hit Save.

Heroku *can* be a free service, but you will eventually have to add a credit card (I think after 5 apps), although it is still free unless you use add-ons or increase the performance. The value Heroku provides is worth hundreds of dollars, feel lucky that
this exists and all you have to do it provide a number and not actually pay anything.

## Install Heroku Toolbelt

https://toolbelt.heroku.com/

click the download link, and install.

### Verify

Type this in the terminal: `heroku version`

Expected result: Heroku Toolbelt v4 or higher

## Verify your existing SSH Key
For your Git setup, you should have created an SSH key. Verify that your SSH key exists, so it can be also be added to Heroku by running the following command:  
`cat ~/.ssh/id_rsa.pub`

The expected output is a bunch of nonsense plus your e-mail address at the end.

## Add SSH Key to Heroku

```
heroku keys:add
```

hit enter to accept the default key file to use
