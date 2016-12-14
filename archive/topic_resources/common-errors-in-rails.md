# Common Errors in Rails

## No route matches

    No route matches {:action=>"show", :controller=>"courses"} missing required keys: [:id]
    
#### The problem

This error appears when a named route has been used without the correct number of named parameters. This one can be tricky, it seems to imply that the route that you are trying to serve is not working, but in fact this error happens when trying to generate the HTML for a different route. For example if we have the code:

    get "/courses/:id", to: "courses#show",  as: :course
    get "/courses",     to: "courses#index", as: :courses
    
And in our `courses/index.html.erb` we have the following

    <h1>Courses</h1>
    <% @courses.each do |course| %>
      <%= link_to "Show #{course.name}", course_path %>
    <% end %> 
    
When we try to load `index` we get the error:

    No route matches {:action=>"show", :controller=>"courses"} missing required keys: [:id]
    
Even though we were trying to load `index`, we're getting an error about show, this is because the `link_to` is using a named route, `link_to` and named routes, in combination, generate a link to a specific path. The problem comes in because `course_path` is a named route, but if we refer to the `routes.rb`, we can see the `course_path` path contains a named parameter of `:id`, without an ID given, this named route does not know how to generate the correct path.

#### The solution

Ensure that all named parameters (any `:`'s in the route) are passed into the named route:

    <%= link_to "Show #{course.name}", course_path(course.id) %>
    
---------

## NoMethodError

    undefined method 'name' for nil:NilClass
    
#### The problem
    
This error happens quite often, and is misleading because the focus of the error message is on the method `name`. But, the actual problem can usually be identified by the object mentioned after "for", in this case `nil:NilClass`. For example:

    <h1><%= @course.name %></h1>
    <p><%= @course.description %></p>
    
Getting the error `undefined method 'name' for nil:NilClass` here would not imply that something is wrong with the `name`, method but actually there is something wrong with what `.name` is being called on, `@course` is not what we expect it to be. It is `nil`. This will happen any time a method and object type don't match up.

#### The solution

The approach to fixing this is to identify what is the object in question supposed to be and where is it being assigned. In this case, it's most likely that `@course` was supposed to be assigned to a `Course` object in the `CoursesController` in the `show` action.

--------

## SyntaxError

    syntax error, unexpected keyword_ensure, expecting keyword_end
    
#### The problem

This error doesn't always look the same, but it is caused when one of two wrapper words/or characters (i.e. `do end`, `( )`, `[ ]`) are missing.

    <% @clubs.each do |club| %>
      <tr>
        <td><%= club.name %></td>
        <td><%= club.club_type %></td>
        <td><%= link_to 'Show', club %></td>
        <td><%= link_to 'Edit', edit_club_path(club) %></td>
        <td><%= link_to 'Destroy', club, class: "ajax-destroy", method: :delete %></td>
      </tr>

In this example the `<% end %>` is missing, the first line is never closed. This error will look slightly different based on which type of wrapper is missing, for example for

    <td><%= link_to 'Edit', edit_club_path(club %></td>
      
The message is

    syntax error, unexpected keyword_end, expecting ')'
    
You can identify which type of wrapper is missing by the what is following the `expecting` in the error message. This error message can also be tricky because the line number given in the stack trace is often incorrect (because the program doesn't know where you intended to end a block)

#### The solution

Pretty easy one once you figure out what is missing and where it goes. This can be a little tricky to figure out where the missing character goes. A couple techniques to help keep it simple

1. Avoid nesting too much complex logic (keep)
2. Use proper indentation
3. Use 2 spaces as tabs

If using these techniques, simply looking for inconsistent indentation can usually solve the problem.

---------

## ArgumentError

    wrong number of arguments (x for y)
    
#### The problem
    
This error happens when a method is not given the correct number of arguments. Every method has a certain number of required arguments, you must fulfill these arguments whenever using the method. Given the method:

    def say_name(name)
      puts name
    end
    
This method requires one argument, and only one argument. If we use it without an argument `say_name`, we will get the error:

    wrong number of arguments (0 for 1)
    
While if we use `say_name("bookis", "kerri")`, we will receive the error message:

    wrong number of arguments (2 for 1)
    
#### The solution

The error message itself tells you how many arguments are expected, if you are using a different number, you will need to change the number of arguments. It can often be helpful to find the source code or documentation for the method to determine what the arguments are supposed to be. For example the method `String#delete` takes one argument, if we use the method without the argument `"hello".delete` we will get this error. To figure out the argument I would look at the ruby docs or just google "ruby string delete", the first result is a link to the correct ruby doc, find "delete" in the list of methods:

    delete([other_str]+)
    Returns a copy of str with all characters in the intersection of its arguments deleted. Uses the same rules for building the set of characters as String#count.

    "hello".delete "l","lo"        #=> "heo"
    "hello".delete "lo"            #=> "he"
    "hello".delete "aeiou", "^e"   #=> "hell"
    "hello".delete "ej-m"          #=> "ho"
    
This not only shows the number of args (`delete([other_str]+)`), but also examples uses of this method.
    


    