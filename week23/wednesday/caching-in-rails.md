# Caching in Rails

As previously mentioned, caching is usually a technique that should be implemented
if there are no other options. Reconsidering site structure, fine tuning queries,
even dynamic loading of content should all be considered before caching.

Caching is a pretty broad term, but we are going to focus on view caching within
rails.

Rails provides a few tools to cache content, page, action, and fragment caching.
Page and action caching used to be included in rails, but in rails 4 they have
been pulled out into a separate gem. Also, by default caching is turned off in 
development so that we don't have to deal with the same cache invalidation issues
while trying to develop. To manually test our caching techniques we're going to 
enable caching in development, in `development.rb`:

```ruby
config.action_controller.perform_caching = true
```

Next let's include the gems that give us page and action caching. In `Gemfile`

```ruby
gem 'actionpack-action_caching'
gem 'actionpack-page_caching'
```

### Page and Action Caching
Page and action caching are super fast, but it will become problematic if you want any dynamic
content on the page (and if that is the case why are you using a dynamic framework?). 
Page caching will render a view once, and save the generated HTML
into a local file. In a slow controller add `caches_page :action_name`:

```ruby
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  caches_page :index
  
  def index
    @posts = Post.includes(:user, comments: :user).paginate(per_page: 300, :page => params[:page] || 1)
  end
end
```

After adding this cache, the next time we render this action it will act normal 
but in our logs we will see something like:

```
Write page /Users/Bookis/work/playground/cacher/public/posts.html (8.2ms)
```

And if we check our `/public` directory, we will find `posts.html`, which will now
be a static page of our action. From now on our application will skip the `PostsController`
entirely and just serve this static page.

As you can see our controller is paginating a bunch of records, so page caching
is completely useless because all pages show the same content.

Page and action caching are very similar, the only difference
is that action caching will still hit your controller to allow for authentication
or something like analytics, but the served content is still statically served.

**Essentially never use page caching or action caching.**

### Fragment Caching

Fragment caching can be a much more reasonable tool, it's similar to action caching
but allows for much more granular control of which sections are cached as well as
how and when they expire. Let's take the same action, but put in fragment caching,
fragment caching happens in the view rather than the controller. We'll wrap the 
content for the page in a fragment cache:

```html
<h1>Listing posts</h1>
<%= will_paginate @posts %>
<% cache do %>
  <%= render @posts %>
<% end %>
<%= will_paginate @posts %>
```

This caches the whole section of posts. One obvious benefit of this is that we
can put dynamic content such as the current users name outside of the `cache` block,
but we still have the problem that each page is the same content. With fragment caching
we can fix this problem by naming the cache section.

```html
<% cache ["posts", params[:page]] do %>
  <%= render @posts %>
<% end %>
```

The optional argument we can give to the `cache` view helper is either a string, hash, or
array (the cache key), the cache will search for appropriate cache in memory for each unique set of objects.
Since `params[:page]` is changing for each view, if we use that in our cache key, then
the cache will serve the appropriate static content for the current page.

What if we add a post? With the current cache, we wouldn't see that post if page
1 had been previously cached, and any pages that hadn't been cached yet would be
off by one post essentially creating gaps in our post history. Rails has an elegant
solution to deal with this problem.

Rails will create an intelligent cache key for you based on an active record object,
the key is generated as `[class]/[id]-[timestamp]` So for a record it might be
`posts/5002-20140411163334000000000`, the timestamp is going to be the `updated_at`
time. To add this we simply give an active record object as the cache key in the view

```html
<% cache @posts.first do %>
  <%= render @posts %>
<% end %>
```

Now the cache key will be based on the first post from this pages posts.

Now another gotcha, what if a post is updated that isn't the first on
a page? We could solve this in two ways, we could either wrap the cache block around
each individual post rather than the group of posts, which would allow for dynamic
ordering of the posts, but this is quite a lot slower, about 20x slower than caching the
whole thing. Alternatively we could use the same cache key (the most recently updated object)
with the `params[:page]`

```html
# PostsController
def index
  @posts = Post.includes(:user, comments: :user).order("created_at desc").paginate(per_page: 300, :page => params[:page] || 1)
  @cache_key = Post.order("posts.updated_at desc").limit(1).first
end

# index.html.erb
<% cache [@cache_key, params[:page]] do %>
  <%= render @posts %>
<% end %>
```

Now if **any** posts are updated the entire cache will be reset. What about if a 
comment is added? The gotcha's can keep piling on, but we could add something that
`touch`'s a post when a comment is created. This approach would be totally ridiculous
if this content was changing often. If it's changing often you may want to go with the
approach of wrapping each individual post in a cache block, it all depends on the use
of our website. 


### Optimizing without Caching

Since we seem to be falling into pitfall after pitfall when using caching, let's
quickly look at the techniques we could reasonably use to speed up our page while
avoiding caching.

1. Dynamically load comments. Similar to Disqus, most of the comments on a list
of blog posts will go unread, why not load them using ajax if someone wants to see them.
This will cut down a significant portion of the DB calls as well as the content rendered 
into the DOM. 
2. Add a counter cache to comments, it's nice to see the number of comments a post
has even if we're not seeing the comments, but needing to do a DB query to figure out
the total count is a big time drain.
3. Reconsider displaying so many posts on a single page, 300 was obviously a test
amount, but reducing from 25 to 10 posts shaves off about 15%. But in our example we'll go to
50 posts from 300.

So now our load time has gone from 2100ms to 79ms, nearly 30 times faster,
now certainly within a reasonable time frame.

### Resources

- [Rails Guide](http://guides.rubyonrails.org/caching_with_rails.html)
- [DHH on Cache Keys](http://signalvnoise.com/posts/3113-how-key-based-cache-expiration-works)
