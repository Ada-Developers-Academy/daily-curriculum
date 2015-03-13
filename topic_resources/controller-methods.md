# Controller Methods

In this lesson we will be learning about the methods and syntax available to all of the rails controller through `ActionController`.

#### Defining Public Methods (Actions)

Rails controllers public methods are generally used for defining for directly handling HTTP requests. These methods are commonly called actions, which is what we will refer to them from now. The common actions we've seen defined are `index`, `show`, `new`, `create`, `edit`, `update`, and `destroy`, although the name of rails actions are not limited in any way.

By default actions render a veiw located in `app/views` under a directory corresponding to the controller name. For example the `index` action withing the `UsersController` would render the view in `app/views/users/index.html.erb`. If you don't want to render a view for an action, like `create`, but instead want to take the user to a different action, using the `redirect_to(path_name)` will override this default functionaltity. 

These two approachces Get-and-show and do-and-redirect are the most common patterns within controller actions.

#### Defning Private Methods

Defining private methods within rails controllers is the same as any other ruby class. At the bottom of the page, on it's own line, write `private`, any methods defined below this word will be private, meaning that they can only be called from within itself. Private methods are most commonly used to define logic which happens in more than one public controller action. 

The common examples we've seen of this are `model_params` and `set_model` (`model` being the name of a model like `book`). These two methods have no special significance, we could name them anything, and we wouldn't need to create them at all if we didn't want to be DRY. Other common private methods could handle the logic for checking the authorization of the current user, updating a model on every request, setting an instance variable that should be available to every view.

#### Inherited Methods

For every HTTP request many accessor methods are defined:

**request** 

The `request` object (an instance of `ActionDispatch::Request`) is the object that keeps track of all of the specifics of the HTTP request, which is actually a lot of data, here are some common attributes this object holds:

- `request.remote_ip`: The IP Address of the visitor.
- `request.referer`: The webpage the user was linked from
- `request.method`: The HTTP method (i.e. `GET`, `POST`, etc...)
- `request.user_agent`: Information about the visitors device, browser, and operating system

**params** 

All request parameters, whether they come from a GET or POST request, or from the URL, are available through the `params` method which returns a hash. Most complex `params` are given through a form submission in a POST or PATCH/PUT request, given the HTML form:

    <form action="/post" method="POST">
      <input type="text" name="post[name]" value="bookis">
      <input type="text" name="post[address]" value="123 fake st">
    </form>
    
It is the `name` attribute the determines the keys within the `params` hash. In this case we have nested attributes, `name` and `address` are nested within the `post`, thinking of this in terms of a hash, this would give us a hash with a key of `post`, the value of `post` would be another hash with two keys `name` and `address`. The `value` attribute in the HTML represents what the user typed into the field. This form submission would generate the params

    {post: {name: "bookis", address: "123 fake st"}}
    

**session**

Sessions allow you to store objects in between requests. Such as an `id` of an object to keep around, or data between a multi-page form. `session` is also a hash. To assign and get values we would use the regular hash syntax:

    session[:user_name] = "Bookis"
    puts "Hello #{session[:username]}"
    session[:user_name] = nil
    
To remove something from the `session` hash simply assign a `nil` value to the key.
    
**render**

The `render` method typically reads and serves HTML from an `ERB` template and serves it in the response. `render` is what rails calls by default at the end of a controller action, but you don't have to rely on the default usage:

    def search
      @results = Search.find(params[:query])
      case @results.count
      when 0 then render :no_results
      when 1 then render :show
      else
        render :index
      end
    end

Additionally `render` takes many optional arguments, the most common is just the template name that you wish to render, but the following can also be used:

- `render :index"`
- `render partial: :partial_name` renders a partial instead of whole template.
- `render json: {some: data}.to_json` will send a JSON response instead of HTML (the same syntax exists for many data types such as XML, text, js, and file)
- `render inline: "<b>HTML will be rendered as though it were in a template</b>"`


**redirect_to**

Redirects are used to move from one action to another. For example, after a create action, which stores a blog entry to the database, we might like to show the user the new entry. `redirect_to` takes an argument to determine which url to send the user to, this argument comes in many forms:

    1 redirect_to articles_url
    2 redirect_to @post
    3 redirect_to "/posts/#{@post.id}"
    4 redirect_to :action => "show", :id => 5
    5 redirect_to "http://www.adadevelopersacademy.org"
    6 redirect_to :back
    
This example shows several methods, 

1. Using a named route, as defined using `as` withing the `routes.rb`
2. Using an ActiveRecord instance object, the url generated is going to assume the default rails RESTful resource, so `/posts/:id` in this case
3. A String, simply passing in the path as a string.
4. Passing in the action name which you would like to generate the path for.
5. Using a complete URL with the protocol (`http`), this will assume the request is not local, so it will not append it to you current root request.
6. `:back` is special, this redirects to the `request.referer` url. Careful with this one, this is not a guarenteed attribute on the `request` object


#### Resources

- [Controller Guide](http://guides.rubyonrails.org/action_controller_overview.html)
- [Action Controller Docs](http://api.rubyonrails.org/classes/ActionController/Base.html)