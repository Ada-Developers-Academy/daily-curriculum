# Rspec Practice

Create a rails app

```bash
rails new rspec-practice -T -d postgresql
cd rspec-practice
```

Add `rspec-rails` gem:

```ruby
group :development, :test do
  gem "rspec-rails"
end
```

bundle and run the rspec installer:

```bash
bundle
rails generate rspec:install
```

Model
------

Create a user class:

```bash
rails g model user email:string password_digest:string
rake db:create db:migrate
```

I expect that the email is required for a user to be valid.

```ruby
# spec/models/user_spec.rb
require 'rails helper'
describe User do
  let(:user) { User.new(email: "b@example.com", password_digest: "1234")}

  describe ".validates" do
    it "is valid with valid attrs" do
      expect(user.valid?).to eq true
    end

    it "requires an email" do
      user.email = nil
      expect(user.valid?).to eq false
    end

    it "requires email to have an @" do
      user.email = "booatboo.com"
      expect(user.valid?).to eq false
    end

  end
end
```

After that I have the validations in place for the user:

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  validates :email, presence: true, format: {with: /@/}
end
```

Controllers
-----------

Create a user controller

```bash
rails g controller users
```

I expect the sign up form to be rendered:

```ruby
# spec/controllers/users_controller_spec.rb
require "rails_helper"

describe UsersController do
  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end

    it "assigns a User object for the form" do
      get :new
      expect(assigns(:user)).to be_a User
    end
  end
end
```

Add logic for a user to see the sign up form

```ruby
class UsersController < ApplicationController

  def new
    @user = User.new
  end

end
```

Add tests for the create method:

```ruby
describe 'POST "create"' do
  let(:request) { post :create, user: {email: "b@example.com"} }
  it 'redirects to the home page' do
    request
    expect(response).to redirect_to root_path
  end

  it 'signs the user in' do
    request
    expect(session[:user_id]).to eq assigns(:user).id
  end

  context 'when invalid attributes given' do
    it 'renders the new template' do
      post :create, user: {email: nil}
      expect(response).to render_template :new
    end
  end
end
```
