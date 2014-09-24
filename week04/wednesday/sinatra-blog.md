# Sinatra Blog

Create a Sinatra blog.

Bronze
------
- Create a blog post in `/views/posts/post-name.erb`
- Create a homepage with hand-written links to recent posts
- Make a route with a named parameter to dynamically find blog posts
- Create a layout file for you home page and blog posts to share

Silver
------
- Create a ruby class to read your `/views/posts` files
- Dynamically display a link to each file within `/views/posts` on your homepage

Gold
----
- Put each blog post inside of an additional folder with the publish date as the directory name `/views/posts/2014-09-24/`
- Use your ruby class to parse the date of each blog post.
- Create a `most_recent(n)` for your class
- Display links to the most recent 5 blog posts on your homepage

Platinum
--------
- Display the content of the most recent 5 blogs posts on the homepage
- Create pagination (pages), allowing the reader to view then next 5 most recent blog posts.
