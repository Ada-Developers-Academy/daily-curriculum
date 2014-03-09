# Beginning Ember

![Ember Flow](resources/ember-flow.png)

## What is Ember.js

## Basic Structure

Just as in Rails, there are a lot of files in this application, but there are those
that will matter to us and those that won't, I'll quickly go over the files that
we will be working with directly. the `app` directory is where everything we will
be working with will live, ignore everything outside of that dir (for now):

- **/app**
    - **/images**
    - **/scripts**
        - **/controllers** 
        - **/helpers**
        - **/models**
        - **/routes**
        - `router.js`
        - `main.js`
        - `templates.js`
    - **/styles**
    - **/templates**
    - `index.html`

Most of these dirs are pretty straight forward once you understand the basics
of ember. The name of the dir stores that js file declaring that kind of object.

A couple gotchas:

1. The `/app/scripts/templates.js` file is automatically generated when Grunt
auto compiles all of the handlebars templates in `/templates`. The `templates.js`
file should never be manually changed.

2. The `index.html` is the place to require all of our application files and their
dependencies. The actual `html` impelementation will happen in the `.handlebars` 
files in the `/templates` dir.

## Naming Conventions

## Handlebars

## ember-data