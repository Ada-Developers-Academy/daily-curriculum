# Heroku Debugging
This is not an exhaustive listing of how to debug a Heroku application, only a few handy tips that usually work.

### Viewing Logs
To get an automatically updated history of your Rails logs from Heroku you can use either of these methods:

Command-line method: `heroku logs`

Website method:
* Visit [Heroku Dashboard](https://dashboard.heroku.com/)
* Select your application
* Click the 'Actions' menu (three vertical dots in the upper right-hand corner of the page)
* Select 'View Logs'

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

This add-on allows you to view and search through a history of your Rails logs from Heroku for the previous several days. Paid versions of the add-on allow for viewing and searching a longer history of logs (up to a year). This is critical for production deployments, as you may not know about an error until long after the relevant logs have disappeared from `heroku logs`.

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
