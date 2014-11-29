# ActionMailer

Mailers are another component of Rails, just like models or controllers. Mailers are similar to controller in that the mailer actions correspond to views (the body of the email), but they differ in that you will explicitly call the mailer method (opposed to routes doing it for you). Let's take a quick look at setting up a basic mailer.

    rails generate mailer ClubMailer

The mailer generator creates a mailer file (app/mailers/club_mailer.rb) and a dir for the corresponding views to go into (app/views/club_mailer). The mailer file is a class that inherits from `ActionMailer::Base`, this class gives us the mail specific methods such as `mail`. Lets start by creating a method in `club_mailer.rb` to send out a congratulatory email inviting the user to come to the club (yes this tutorial changed from golf clubs to dance clubs).

```ruby
class ClubMailer < ActionMailer::Base
  default from: "from@example.com"

  def join_us
    @club = Club.first
    mail(to: "bookis.smuin+club@gmail.com", subject: "Come join #{@club.name}" for a dance party!)
  end
end
```

For now, this email always sends to me. But, let's start trying to use this mailer through the rails console.

```bash
rails console
club_mailer = ClubMailer.join_us
# => ActionView::MissingTemplate: Missing template club_mailer/join_us
```
We get an error asking for a template, so let's create one

```bash
touch app/views/club_mailer/join_us.html.erb
rails console
club_mailer = ClubMailer.join_us
# => #<Mail::Message:70293938654000, ...
```

Great, so now it returns this `Mail::Message` object, this object has a method called `.deliver`, which will actually try to connect to a mail server and send the email.

```ruby
club_mailer.deliver
#...
# => Sent mail to bookis.smuin+club@gmail.com
#...
```
It looks like this email was successfully sent, but you'll never actually get it because it's not actually hooked up to a mail server. Let's hook one up. You can use pretty much any email server including your personal gmail account. For a production
application you would want to use something better suited for large scale sending. Look into [Mandrill by Mailchimp](https://mandrillapp.com), which is a transactional email service meant for production.

We'll use Gmail credentials to add some configuration to our `development.rb`, inside of the `configure` block:

```ruby
config.action_mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            ENV["MAIL_USERNAME"], # your gmail login
  password:             ENV["MAIL_PASSWORD"], # your gmail password
  authentication:       'plain',
  enable_starttls_auto: true  
}
```

Now if we try the same mailer, we should receive an email:

```ruby
    club_mailer = ClubMailer.join_us
    club_mailer.deliver
```
Right now the club we're sending an email about is hardcoded in (`Club.first`),
we can make a mailer method take any number of arguments, just like any other ruby
method. We'll make the `.join_us` method take a club id, and in the method we'll
use the id to look the club up from the database.

```ruby
class ClubMailer < ActionMailer::Base
  default from: "from@example.com"

  def join_us(club_id)
    @club = Club.find(club_id)
    mail(to: "bookis.smuin+club@gmail.com", subject: "Come join #{@club.name} for a dance party!")
  end

end
```

Next, let's integrate this idea with our application, for now we'll just have it sent the email when someone chooses a club, which happens in our `PlayerClubsController` `create` action:
```ruby
class PlayerClubsController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    PlayerClub.create(club_id: @club.id, player_id: current_user.id)
    ClubMailer.join_us(@club.id).deliver
    redirect_to root_path
  end
end
```
