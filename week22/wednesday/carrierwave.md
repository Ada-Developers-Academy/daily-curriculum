CarrierWave and S3
------------------
CarrierWave is a gem that adds a fairly simple and flexible way to users to upload files to our Rails application. It also lets us resize images to make thumbnails and other sizes as we need them, and lets us upload all these uploaded (and generated) files to cloud storage products, such as S3.

## How-to
### Make an S3 bucket
S3 -- Simple Storage Service
"buckets" are like folders

Let's start with a new Rails app

```bash
$ rails new band_practice
$ cd band_practice
$ rails g scaffold band name genre
$ rake db:migrate
```

### Setup Carrierwave and Fog Gems

Fog is a gem that helps us work with *cloud services* like those from Amazon - EC2 or S3 - as well as cloud offerings from other companies (like Microsoft, Rackspace, Blue Box, etc).

```ruby
gem 'carrierwave'
gem 'fog'
gem 'figaro'
```

Might as well set up Figaro now, too.

```
$ rails g figaro:install
```

### Add an Uploader
Now you need a uploader. This is the file which has all the settings like which folder the image will be saved, setting the image quality, caching etc.

```bash
$ rails g uploader image
```

The generator creates a new directory called `uploaders` under the `app` directory and in it a file called `image_uploader.rb`. In this file are a number of comments explaining how to customize the uploader. For example there is code to change the upload location, perform processing on the image after uploading and to restrict the type of files that can be uploaded. You should take a look at these options on your own, but for demonstration purposes we're going to get rid of most of it in favor of this:

```ruby
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fit => [256, 256]
  end

  version :full do
    process :resize_to_fit => [2048, 2048]
  end
end

```

Next we'll need to add the uploader to the `Band` model. We'll need a column in the bands table to store it in so we'll generate a migration to do add it.

```bash
 $ rails g migration add_image_to_bands image:string
 $ rake db:migrate
```

Then, we *mount* the uploader on the `Band` model.

```ruby
class Band < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
```

Add a `file_field` to the Band form.

app/views/bands/_form.html.erb
```ruby
<div class="field">
  <%= f.label :image %><br>
  <%= f.file_field :image %>
</div>
```


We add `:image` to the strong params for the controller.

app/controllers/bands_controller.rb
```ruby
def band_params
  params.require(:band).permit(:name, :genre, :image)
end
```

Finally, we modify the scaffolded form and show pages to include a form element for the image upload, and modify the `form_for` to add an `:html` option.

apps/views/bands/show.html.erb
```ruby
<p>
  <%= image_tag @band.image_url.to_s %>
</p>
```

Now we can upload images - yay! In your terminal, take a look at `public/uploads` - `mini_magick` and `carrierwave` made all those files for us! We have access to these different sizes by passing the symbol of the size (as defined in our uploader model) to `#image_url`

app/views/bands/show.html.erb
```ruby
<p>
  <%= image_tag @band.image_url(:thumb).to_s %>
</p>
```


## Uploading to S3

This is cool, but we want to save to S3 instead of the local file system. This is pretty easy. First, we need to tell CarrierWave that we want to use S3. Make a new initializer, `config/initializers/carrierwave.rb`

```ruby
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['S3_KEY'],
    aws_secret_access_key:  ENV['S3_SECRET'],
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage           = :file
    config.enable_processing = false
    config.root              = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir        = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  config.fog_directory    = ENV['S3_BUCKET_NAME']
end
```

We also need to fill out our `config/application.yml` file. We can get the secret information from the *Security Credentials* screen in the AWS dashboard - I won't go into how to fetch this information here, as its likely to change from time to time.



## Resources

[Railscasts #253 CarrierWave File Uploads](http://railscasts.com/episodes/253-carrierwave-file-uploads?view=asciicast)

[Railscasts #383 Uploading to Amazon S3](http://railscasts.com/episodes/383-uploading-to-amazon-s3?view=asciicast)

[Allowing File Uploads with CarrierWave](http://richonrails.com/articles/allowing-file-uploads-with-carrierwave)

[Saving files in Amazon S3 using Carrierwave and Fog Gem](http://www.javahabit.com/2012/06/03/saving-files-in-amazon-s3-using-carrierwave-and-fog-gem/)




