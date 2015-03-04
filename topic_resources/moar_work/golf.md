# Jquery Golf Practice

Getting Started
---------------

- Clone [this repo](https://github.com/Ada-Developers-Academy/golf-jquery-practice)
- Get the app running with:

```bash
cd golf-jquery-practice
bundle
rake db:create db:migrate db:seed
rails server
```

- Navigate to the root page in the browser

Todo
-----
- Use jQuery in `/app/assets/javascripts/clubs.js` to override the "Choose" button's click event.
- When the button is clicked add a class of "chosen" to the `<div>` surrounding the club
- Style the class of `.chosen` to have a green-ish background in `/app/assets/stylesheets/clubs.css.scss`.
