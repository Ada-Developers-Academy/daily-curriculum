Content Delivery Networks
-------------------------

A common way to speed up a website is to use a **Content Delivery Network**, or "CDN". So what is a CDN, and how does it work?

A CDN is a system of geographically distributed servers that hold copies of your content. When a request comes in for a particular file, the system decides which server would be able to deliver the file to the user the fastest (usually based on the geographical location of the user) and sends the file from that server.

Here's an image from one of the URLs in the Resources section that may illustrate this.

![](http://cdn.happybearsoftware.com/assets/posts/use-cloudfront-and-the-rails-asset-pipeline-to-speed-up-your-app/cloudfront-diagram-6d6a84db66f99474d32d6bfc2072bb03.gif)

This is different from S3, because S3 is about *storing* files. Amazon's CDN is called **CloudFront**, and its focus is *delivering* files. When you add a new file to S3, Amazon will automatically copy it to all the servers in CloudFront.

A CDN looks and behaves like its own domain name. Instead of

```
http://www.mycoolsite.com/awesome_image.jpg
```
..with CloudFront, URLs look something like this

```
http://my-cool-site.cloudfront.net/awesome_image.jpg
```

## Set Up A CloudFront Distribution

Setting up a new distribution for your Rails app is fairly simple. Start by logging into the AWS management interface, selecting 'Cloudfront' and then 'Create distribution'.

![](http://cdn.happybearsoftware.com/assets/posts/use-cloudfront-and-the-rails-asset-pipeline-to-speed-up-your-app/cloudfront-create-distribution-7b68a275c24e8cf2ae387d5dc772c268.png)

The default settings are perfectly fine for our basic applications in Ada. Keep in mind though, **CloudFront is not free**. (Its cheap, but just keep this in mind.)

## Setup Rails

If you want the contents of `app/assets/` to be served from a CDN, we would add this to `config/environments/production.rb`

```ruby
config.action_controller.asset_host = "your-cdn-url.cloudfront.net"
```

If we're using CarrierWave, we need to add this to `config/initializers/carrierwave.rb`
```ruby
config.asset_host = "http://your-cdn-url.cloudfront.net"
```


## Resources

[How to speed up your Rails app with Cloudfront and the asset pipeline](http://happybearsoftware.com/use-cloudfront-and-the-rails-asset-pipeline-to-speed-up-your-app.html)

[Using Amazon CloudFront CDN on Heroku](https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn)