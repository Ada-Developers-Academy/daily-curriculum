# ActionMailer

Mailers are another component of Rails, just like models or controllers. Mailers are similar to controller in that the mailer actions correspond to views (the body of the email), but they differ in that you will explicitely call the mailer method (opposed to routes doing it for you). Let's take a quick look at setting up a basic mailer.

    rails generate mailer ClubMailer
    
The mailer generator creates a mailer file (app/mailers/club_mailer.rb) and a dir for the corresponding views to go into (app/views/club_mailer). The mailer file is a class that inherits from `ActionMailer::Base`, this class gives us the mail specific methods such as `mail`. Lets start by creating a method in `club_mailer.rb` to send out a congratulatory email inviting the user to come to the club (yes this tutorial changed from golf clubs to dance clubs).

    class ClubMailer < ActionMailer::Base
      default from: "from@example.com"
      
      def join_us(club_id)
        @club = Club.find(club_id)
        mail(to: "bookis.smuin+club@gmail.com", subject: "Come join #{@club.name}" for a dance party!)
      end
    end
    
For now, this email always sends to me. But, let's start trying to use this mailer through the rails console.

    rails console
    club_mailer = ClubMailer.join_us(Club.last.id)
    # => ActionView::MissingTemplate: Missing template club_mailer/join_us
    
We get an error asking for a template, so let's create one

    touch app/views/club_mailer/join_us.html.erb
    rails console
    club_mailer = ClubMailer.join_us(Club.last.id)
    # => #<Mail::Message:70293938654000, ...
    
Great, so now it retuns this `Mail::Message` object, this object has a method called `.deliver`, which will actually try to connect to a mail server and send the email.

    club_mailer.deliver
    #...
    # => Sent mail to bookis.smuin+club@gmail.com
    #...
    
It looks like this email was successfully sent, but you'll never actually get it because it's not actually hooked up to a mail server. Let's hook one up. You can use pretty much any email server (including your personal gmail account), but I'm going to setup this to use [Mandrill by Mailchimp](https://mandrillapp.com), which is a transactional email service. Start by signing up. After answering the basic questions, click on the link to get your "SMTP Credentials", click "+ new api key", we'll use these credentials to add some configuration to our `development.rb`, inside of the `configure` block:

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              "smtp.mandrillapp.com",
      port:                 587,
      enable_starttls_auto: true,
      user_name:            "bookis@adadevelopersacademy.org", # YOUR MANDRILL USERNAME
      password:             "mT-MofA-tDxbzeR_FLFaKw", # A MANDRILL API KEY
      authentication:       'login',
      domain:               'yourdomain.com'
    }
    
Now if we try the same mailer, we should receive an email:

    club_mailer = ClubMailer.join_us(Club.last.id)
    club_mailer.deliver
    
Next, let's integrate this idea with our application, for now we'll just have it sent the email when someone creates a club, which happens in our `ClubsController` `create` action:

    #...
    if @club.save
      ClubMailer.join_us(@club.id).deliver
      #...
      
