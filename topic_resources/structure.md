#Structure

This is a whiteboarding lecture. It almost certainly won't be recorded. Sorry,
folks :(


##MVC/Rails structure

This is a pretty terrible structure, but it's basically what you see out in 
the world a lot of the time. The exact structure will vary depending on what
your AngularJS app is running on--Express, Rails, etc.


###Rails app

    Main directory
      app
        assets
          images
          javascripts
          stylesheets
        controllers (Rails)
        helpers
        models
        views
      other stuff


###Rails app with Angular

    Main directory
      app
        assets
          images
          javascripts
            app.js
            angular
              controllers (Angular)
                posts.js
                tags.js
                users.js
              directives.js
              filters.js
              services.js
          stylesheets
        controllers (Rails)
        helpers
        models
        views
      other stuff


###Alternative structure

    Main directory
      app
        js
          app.js
          controllers (Angular)
            posts.js
            tags.js
            users.js
          directives.js
          filters.js
          services.js
        assets
          images
          stylesheets
        views
      other stuff--maybe bower or npm?


##Modular structure

    Main directory
      assets
      public
      src
        app.js
        posts
          posts.js
          posts.css
          edit.html
          show.html
          index.html
        tags
          tags.js
          tags.css
          edit.html
          show.html
          index.html
        other module
        other module
        other module