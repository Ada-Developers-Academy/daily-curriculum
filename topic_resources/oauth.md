# OAuth
OAuth stands for Open Authorization.  
![OAuth](resources/oauth.png)

OAuth is a protocol that allows for a more streamlined user experience for login, utilizing an existing application's logon experience. This is because OAuth allows you to share your private resources stored on one site with another site without having to hand out your username and password.

Have you ever used your Facebook account to log on to another site so that you didn't need to create a new username and password to remember? Have you ever used your GitHub, Twitter, etc. to do the same?


A typical example offered by the OAuth spec (Appendix A) is when a user wants to print a photo stored on another site. The interaction goes something like this:
- the user signs into the printer website and place an order for prints.
- The printer website asks which photos to print and the user chooses the name of the site where her photos are stored (from the list of sites supported by the printer).
- The printer website sends the user to the photo site to grant access.
- At the photo site the user signs into her account and is asked if she really wants to share her photos with the printer.
- If she agrees, she is sent back to the printer site which can now access the photos. - At no point did the user share her username and password with the printer site.
