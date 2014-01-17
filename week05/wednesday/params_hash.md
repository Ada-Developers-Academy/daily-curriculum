## Params Hash (Sinatra & Rails)

Within Sinatra there is a method we can access called `params`, `params` returns a hash. Before we get further into this, let's look at the documentation for [Sinatra::Base](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb) (which is what our Sinatra app class inherit from) [docs](https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb). On lines 75-87

    attr_accessor :params

    def initialize(entry)
      params = entry.scan(HEADER_PARAM).map! do |s|
        key, value = s.strip.split('=', 2)
        value = value[1..-2].gsub(/\\(.)/, '\1') if value.start_with?('"')
        [key, value]
      end

      @entry  = entry
      @type   = entry[/[^;]+/].delete(' ')
      @params = Hash[params]
      @q      = @params.delete('q') { 1.0 }.to_f
    end
    ...
    
We see that `params` is simply an instance variable (`@params`) being defined by the `attr_accessor :params`. Pretty familiar.

So in our route declarations in Sinatra, we can use this method to access the hash

    get "/" do 
      params # This method returns a hash
      erb :index
    end
    
So what is in the `params` hash? All of the relevant data from the URL matching or from a form submission will be assigned to the `params` hash on each request. The data does not persist between requests so everytime the page loads the hash is reassigned with that requests data.

