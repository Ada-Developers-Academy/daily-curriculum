### IRC channel

There is a group of volunteers who have offered to hang out online all day to answer any questions you may have as you learn your new craft. They're in an IRC chatroom called #adadevacademy on freenode.

If you're not familiar with IRC, here is a set of instructions that will help you find your volunteer question-answerers:

#### Obtain an IRC client 

IRC clients vary in their features and commands, but that's nothing to worry about. One popular option on Mac is Adium (https://adium.im/). Pidgin (http://www.pidgin.im/download/) is another popular option which runs on Linux, MacOS, and Windows.

Commands preceded by / in the following instructions can typically be typed into an already-open chat window. There should be menus/dialogs/settings in your chat client to accomplish each of these results as well, but we've just included the commands to make things simple.

== Connect to the IRC network==

* Obtain and run an IRC client.
* Connect to chat.freenode.net. You can use your client's dialogs and settings to get this done. This can also be accomplished with the command `/server chat.freenode.net`.
* If your client has not provided you with the option already, select a nickname. You can typically change your nickname with the command `/nick [new-nickname-here]`
* A webclient for IRC = https://kiwiirc.com/client/irc.freenode.net/
* If you have registered this nickname, identify yourself to the Freenode servers (see below).
* Join one or more channels: For instance, `/join #adadevacademy`


== Register your nickname, identify, and enforce ==
If you connect frequently, you should register your nick with the NickServ service. This helps you establish "ownership" over a nickname: you can remove other users who are using the nickname, and it also provides a small amount of protection against people impersonating you using the nickname. 

For instructions how to register, type `/msg nickserv help register`. This will inform you that the syntax for registration is
 `/msg nickserv register [password] [your@email.address.com]`
You should substitute an actual password for [password]. *It is a bad idea* to use something easily guessed. It is also a bad idea to use another password for more secure things you do - IRC passwords should not be considered "secure", and it is easy to accidentally type your password into a channel instead of identifying with it (see below).  Of course, you should insert your actual email address where indicated above.  Then, check your inbox for a message from freenode.  It's worth noting that for all of these commands, you don't need the "["brackets"]". 

To take advantage of your registration you must identify yourself with NickServ every time you connect. The syntax for this is `/msg nickserv identify [password]`
Your IRC client may provide an option to automatically send this message when you connect. Consult its documentation for more information. If you do not identify with your account occasionally, your registration might be removed by freenode staff if someone else wants the nickname (typically after a period of 60 days).


To change your password, use the command (after identifying)
`/msg nickserv set password [NewPasswordGoesHere]`

IRC clients typically have an option to use an 'alternate nickname' to use if the primary nickname is in use when you connect (for example, if someone else is using it, or if you have been abruptly disconnected and a "ghost" of your original connection remains). Freenode recommends that you group this alternate nick (`/msg nickserv help group`) to your primary nickname. Once your nick is registered, you can enable 'enforce'.  This will force any user claiming the nick to identify with the password within 30 seconds.  This protects you from imposters taking your nick while you're offline.  Since you configured your client to automatically identify, nothing changes for you (except being protected).  `/msg nickserv set enforce on`

See also: http://freenode.net/faq.shtml#registering

See you online!