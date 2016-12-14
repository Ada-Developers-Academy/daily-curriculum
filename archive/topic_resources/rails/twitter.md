## Twitter
Create a single serving (no users) version of Twitter. The app should have:

- Tweet model
    - body (must be present, max 140 characters long)
    - author
- TweetsController
    - An `index` action which shows all of the tweets
    - A `show` action to view a specific tweet
    - A `new` action (optional, you can put the form on `index`)
    - A `create` action where tweets are created

### Optional

- tweet_spec.rb
    - Testing validations of body (presence and length)
    - Testing any addition methods you add
- tweets_controller_spec.rb
    - Test each controller action
    - No need to test private actions

### Extra Credit

Implement Users using a TDD approach.
