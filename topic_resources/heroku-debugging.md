# Heroku Debugging
This is not an exhaustive listing of how to debug a Heroku application, only a few handy tips that usually work.

### Logging
`heroku logs`

### App information
```
heroku info
heroku status
```

### Running the Rails console
`heroku run rails console`

### Re-Seeding your DB
```
heroku pg:reset DATABASE_URL
heroku run rake db:migrate
heroku run rake db:seed
```

### Restarting
`heroku restart`

### PaperTrail Add-On
https://elements.heroku.com/addons/papertrail

From an individual heroku application on the web app:
- Select "Find More Add-Ons"
- Logging category
- Papertrail
- Run command for creating the heroku addons
- Return to the Heroku application web page
- Click on Papertrail link

### Show Detailed Error Pages
Change the following line in your `config/environments/production.rb` file:
```
config.consider_all_requests_local = true
```
**IMPORTANT: Make sure to change this back to `false` after you've finished fixing bugs!**
