# RESTful routes

REST is a pattern to that helps us provide a consitent method of accessing and managing our resources (models) on the web. The pattern shows that `/users` and `/users/:id`. An example of standard rails RESTful routes:

    /users/       method="GET"     # :controller => 'users', :action => 'index'
    /users/1      method="GET"     # :controller => 'users', :action => 'show'
    /users/new    method="GET"     # :controller => 'users', :action => 'new'
    /users/       method="POST"    # :controller => 'users', :action => 'create'
    /users/1/edit method="GET"     # :controller => 'users', :action => 'edit'
    /users/1      method="PUT"     # :controller => 'users', :action => 'update'
    /users/1      method="DELETE"  # :controller => 'users', :action => 'destroy'
    
Check out the [Rails Routing Guide](http://guides.rubyonrails.org/routing.html) for more on RESTful rails routes
    
Note: *This lecture was primarily live coded.*