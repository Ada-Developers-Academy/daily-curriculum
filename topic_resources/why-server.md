[Google presentation](https://docs.google.com/presentation/d/1I7iuGnpcbNlOgynM5wMfTVkjivINRuEYpW09v_pAnl4/edit?usp=sharing)
[Recording, which switches over to a different talk partway through](https://www.youtube.com/watch?v=6SBRejAM9p8)

#Why use a server with AngularJS?

As we learned on Tuesday, you don't actually need to use a server with
AngularJS--you can open up the file without one. So, why would we use
a server instead of just opening it up in the browser?

##Same-Origin Policy and CORS

We talked briefly about same-origin policy and CORS, but this is an important
topic that bears repeating, and it applies not just across all JavaScript
frameworks, but when you are making Ajax calls in other apps, as well.

Same-origin policy controls which documents or scripts loaded from one
origin can be accessed or interacted with by a script on another origin.
"Same origin" means the same protocol, port, and host name for each page.
It's surprisingly hard to research why this happens and what in particular it
protects against, but it is an industry standard and most browsers and most
frameworks do not allow cross-browser querying without specific restrictions.

APIs, like the API that Bookis created, can greenlist certain requests
or (more commonly) certain origins. However, most modern browsers still 
prevent cross-origin requests made by JavaScript or other scripts. They also
prevent JavaScript from making server requests if the page is loaded directly
from the file system.

One way to circumvent this issue is by using CORS, or Cross-Origin Resource
Sharing. CORS is a standard set by the W3C that includes specific headers
and policy enforcement. It can be complex to implement, but luckily, many
frameworks have libraries that handle this issue.

Resolving same-origin policy issues is particularly important with AngularJS,
since some directives (including the directives we use to render partials,
ng-view and ui-view) use Ajax to load these views. This is a cross-origin request.

So, we use a server for two reasons:

1) Modern browsers are more likely to greenlist calls that come from a server
than calls that come directly from the file system.

2) npm has libraries that can handle any additional CORS issues we may face.