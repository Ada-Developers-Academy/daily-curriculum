Internationalization (I18n)
---------------------------

Rails by default installs support for internationalization (or *I18n*) through the gem `i18n`. This gem add support for multiple language dictionaries and translation files, to let you easily change the language your site displays.

As you can imagine, I18n is a complex problem, since human languages differ in so many ways (pluralization, grammar, etc.) The Rails I18n API isn't perfect, but it does a fairly good job focusing on supporting English and other similar languages, and provides a framework to add support for languages that fall outside the paradigm of those (Japanese, Tagalog, or Hebrew, for example.)

## Getting Started

Let's build a new Rails app and create a simple "hello world" page.

```
$ rails new i18n_demo
$ cd i18n_demo
$ rails g controller welcome
```
(also modify views/welcome/index.html.erb)

Once we get a page that says "Hello World", let's use a translation dictionary to render this string.

*welcome.html.erb*:
```erb
<%= t(:hello) %>
```

*config/locales/en.yml*:
```
en:
  hello: "Hello world"
```


We reload the page, and magic! Rails loads the string from the translation file. 

Let's set this app up to give us this page in French. First, let's make a new translations file:

*config/locales/fr.yml*:
```
fr:
  hello: "Bonjour!"
```

There's a variety of ways to tell our Rails application we want to change from the default language (which is English.) For the purposes of this demonstration, we'll use a simple query string. 

*app/controllers/application_controller.rb*:
```
before_action :set_locale

def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end
```

Let's restart our server, and append `?locale=fr` to our URL and see what happens.

Awesome!

We could define a translation file for any language; we're not limited to just the 2 letter language abbreviations!

*config/locales/pirate.yml*:
```
pirate:
  hello: "Ahoy mateys!"
```

By starting with I18n early in an app, its fairly easy to add new language support to your application. Generally its a matter of taking an existing translations file and sending it to a translator to interpret the strings for you, then adding it to your repo.

Of course, nothing is ever that simple.

## Interpolation

What if we wanted to greet a user by name?

*config/locales/en.yml*:
```
hello_name: 'Hello, %{name}!'
```

*app/views/welcome/index.html.erb*:
```
<%= t(:hello_name, name: "Kerri") %>
```

We're just putting a string in here, but it could easily be a value from an object. For example:

```
<%= t(:hello_name, name: current_user.name) %>
```

While this solution generally works fine, you may be able to already see how this is potentially a sticky situation, depending on the language!

## Pluralization

The other situation that comes up that causes some problems is pluralization.

*config/locales/en.yml*:
```
inbox:
  zero: 'You have no messages'
  one: 'You have one message'
  other: 'You have %{count} messages'
```

*app/views/welcome/index.html.erb*:
```
<%= t(:inbox, count: 2) %>
```

Magic!

## Resources

[Rails Guides - I18N](http://guides.rubyonrails.org/i18n.html)
[Demo app used in this lecture](https://github.com/Ada-Developers-Academy/i18n_demo)







