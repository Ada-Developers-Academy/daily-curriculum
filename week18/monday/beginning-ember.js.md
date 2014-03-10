# Building an Ember.js app

We're going to start by setting up a basic ember application. The goal of this
lecture is to:

- Install the basic tools
- Walk through one option for structuring an ember application
- Use a Handlebars template compiler
- Use Fixtures for quick data
- Build a basic scaffold

## Step 1: Creating a route

First we will install some tools:

```bash
brew update
brew doctor
brew install node
sudo npm install -g bower
sudo npm install -g grunt-cli
```
If the last step worked, then you have the basic tools installed. The primary tool
that we installed is `npm` (node package manager) which is similar to `brew`, but
more specific for web application tools.

Download and install the [Ember Inspector](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi).

Next, pull a skeleton repo and get our local server running.

```bash
cd your/work/dir
git clone git@github.com:Ada-Developers-Academy/ember-skeleton.git
cd ember-skeleton
npm install
bower install

```
Choose option (2) if Bower asks for a version number.

Those last two comands will read the `package.json` and `bower.json` in the 
application to install all of the needed tools a libraries needed
for this application. This is similar to a Gemfile but for javascript and front-end
libraries.

One of the major tools our application will use is called [Grunt](http://gruntjs.com/)
which is a tool to automate javascript tasks. We will use it to start / stop the
server, compile our templates, as well as watch the files to update the browser automatically.

Let's try it out, run:

```bash
grunt serve
```

This will start the server that serves your ember app at http://localhost:9000.

Next lets add the basics to show another view:

Open your application in your text editor, then open the `router.js` file:

```js
App.Router.map(function(){
  this.route("home", { path: "/" })
});
```

The line we just added registers the `home` route. It also specifies tha path (URI)
that will trigger this route. If a path is not given the path will be the same as
the name of the route declaration. 

The consistency of naming (`home`) is very important
this `home` route will look in the `/app/scripts/routes/` dir for a `home.js` file,
which will be expected to define the `HomeRoute` class. All of these files must be
named using the same root word of `home`. So let's add the Route class.

```bash
mkdir app/scripts/routes
touch app/scripts/routes/home.js
```
In the `home.js` route file you just created:

```js
App.HomeRoute = Ember.Route.extend({
  
})
```

And add a `script` tag for this file in `app/index.html` on about line 56:

```html
<!-- Include all routes here -->
<script src="scripts/routes/home.js"></script>
```

Again, naming is important `HomeRoute` is expected to be the name of the file + `Route`
This name is also expected to match a declaration in the `router.js` file, this same
naming convention will be used for the other related classes we create, such as 
the template file. We'll create that now:

```bash
touch app/templates/home.handlebars
```

Open up that file and add some basic HTML

```html
<h1>Welcome Home</h1>
```

Grunt should detect this change and automatically refresh the page for you. You should
now see the `Welcome Home` you just added.

####Note: Ember is magic

- *You will notice that we didn't create a controller, that is because ember is smart
enough to know to create one for us with nothing special about it if we didn't 
create one for it. This is actually true of the route file as well. :) & :(*

## Step 2: Adding a model

So far we have created a static page, that's cool, but not really. Let's add a
data model that we can show on the page. We'll create the same set of files
we did for the `home` page, as well as a model:

```bash
touch app/templates/plants.handlebars
touch app/scripts/routes/plants.js
mkdir app/scripts/models
touch app/scripts/models/plant.js
```

Now let's quickly setup the routes for a model, in `router.js`

```js
App.Router.map(function(){
  this.route("home", { path: "/" })
  this.resource("plants")
});
```

Notice the route definition uses `resource` instead of `route` this indicates
that there is an associated model called `plant` (it knows to singularize model names)

Next we'll add the model in `app/scripts/models/plant.js`

```js
App.Plant = DS.Model.extend({
  name: DS.attr("string"),
  description: DS.attr("string"),
  image: DS.attr("string"),
  family: DS.attr("string")
})
```

The model is "inheriting" from the `DS.Model` class `DS` is for Data Store, 
this is one of the classes we get from using the `ember-data` library.

We start by defining the attributes this object will have, here
we have three attributes each of them are strings. The other possible data types
that the `DS.Model` class allows are "date", "number", and "boolean" as well as
the association types `DS.belongsTo('nameOfClass')` and `DS.hasMany('nameOfClass')`

Right below the `Plant` model, we will add some fixture data, this is temporary
data that we can easily add to our application before we add a database backend.
This allows for much faster and agile development.

```js
App.Plant.FIXTURES = [
  {
    id: 1,
    name: "Chrysanthemum",
    image: "http://upload.wikimedia.org/wikipedia/commons/b/b3/Chrysanthemum_sp.jpg",
    description: "Chrysanthemum morifolium (also known as Florist's daisy and Hardy garden mum) is a species of perennial plant. The plant is 1–3 feet (0.30–0.91 m) high and wide",
    family: "Asteraceae"
  }, {
    id: 2,
    name: "Camellia",
    image: "http://upload.wikimedia.org/wikipedia/commons/archive/f/f4/20070921095637%21Camellia_sasanqua1JAM343.jpg",
    description: "Camellias are evergreen shrubs or small trees up to 20 m (66 ft) tall. Their leaves are alternately arranged, simple, thick, serrated, and usually glossy. Their flowers are usually large and conspicuous, one to 12 cm in diameter, with five to nine petals in naturally occurring species of camellias. The colors of the flowers vary from white through pink colors to red; truly yellow flowers are found only in South China and Vietnam.",
    family: "Theaceae"
  }
]
```

Next, we need to tell our Route which model data to use for this template, open
`app/scripts/routes/plants.rb`:

```js
App.PlantsRoute = Ember.Route.extend({
  model: function () {
    return this.store.find("plant")
  }
})
```

Here we've used the same Route definition as before, and the naming convention matches
for the ***plants*** route we want to declare the ***Plants***Route class.

Additionally we've added `return this.store.find("plant")`, this is the code that
loads the data from the data source, this is equivalent to `Plant.all` in RoR.

In ember a common `store` object is used for all data models, routes have access to that
store. The store's `find` method takes an argument which is the name of the data class.

Next add `script` tags in `index.html` for the route and model files we just created
around line 58:

```html
<script src="scripts/routes/plants.js"></script>

<!-- Include all models here -->
<script src="scripts/models/plant.js"></script>
```

Now we have our data model in place for this route, navigate to the page at 
http://localhost:9000/#/plants

We don't see anything new, that is because we haven't added anything to our handlebars
template yet, let's do that. In `app/templates/plants.handlebars`:

```html
<h1>Plants Directory</h1>
<div class='row'>
  <div class='col-lg-2'>
    <h4>All Plants</h4>
    <ul>
      <li>Plants go here</li>
    </ul>
  </div>
  <div class='col-lg-10'>
    Plant View Goes Here
  </div>
</div>
```

And grunt should pick up on that change and refresh your browser for you. There
still isn't any real data, let's plug it in with Handlebars.

### Handlebars

Our current `model` data is a collection (`Array`) of plant objects,
in our sidebar we will use Handlebars to iterate over those objects and create
links in a list.

```html
<div class='row'>
  <div class='col-lg-2'>
    <h4>All Plants</h4>
    <ul class='list-unstyled'>
      {{# each }}
        <li>
          {{# link-to "plants" }}
            {{ name }}
          {{/ link-to }}
        </li>
      {{/ each }}
    </ul>
  </div>
  <div class='col-lg-10'>
    Plant View Goes Here
  </div>
</div>
```

And again grunt picks up on this, now your view should have the list of plants
in your Fixtures, with a link. Right now the link is just going to the same page,
but that is because we haven't created another page to link to yet.

## Step 3: Nesting Routes & Templates

Next we'll add the equivalent of a rails `show` action, this will be a route that
will be responsible for finding a specific plant and showing it's template. In 
Ember a common pattern is to nest the specific object into the template of all
of the objects, this pattern is called Master/Detail. On the left we'll have the
Master (list) of the plants, and on the right we'll have the Detail (more info)
of a specific plant. 

Not only will the templates be nested, but the actual route
definition as well, in `router.js`:

```js
this.resource("plants", function () {
  this.resource("plant", { path: ":plant_id" })
})
```

We've added a `function` as a second argument to our existing `plants` route.
Now our app will expect this Master/Detail pattern. We've also specified the path
of this new route to be `:plant_id`, this is exactly the same as rails routes,
`:plant_id` is a wildcard, whatever value is put there will be translated into
data in our actual Route object. Create a route file `app/scripts/routes/plant.js`

```js
App.PlantRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find("plant", params.plant_id)
  }
})
```

**Be sure to add this file in the index.html**

Notice we are accepting `params` in this function, the `:plant_id` comes in through
this object. 

Again, we are using the `store` object to find our model data, but this time
we pass in the id of a record we want, this is equivalent to `Plant.find(params[:id])`
in RoR.

Next we'll add a confusing little peice of code to the `plants.handlebars` file
replace `Plant View Goes Here` with:

```html
{{ outlet }}
```

In this same file, also change the `link-to` to use the new `plant` route we just created:

```html
{{# link-to "plant" this }}
  ...
```

Similar to `self` in rails, here `this` represents the current object in the each
loop, which is a plant object.

`outlet` is similar to Rails `yield`. This will allow the plant template (which we're about to create) to be rendered
inside of the plants template. Ember is intended to allow `outlets` to render more
`outlets`.

Next create a `plant.handlebars` in the `templates` dir:

```html
<h1>
  {{ name }} 
  <small class='muted'>({{ family }} family)</small>
</h1>

<div class='row'>
  <div class='col-lg-8'>
    <img {{ bind-attr src=image }} class='thumbnail col-lg-12' />
  </div>
  <div class='col-lg-4'>
    {{ description }}
  </div>
</div>
```

This adds the content that will be rendered within the `outlet` of the `plants.handlebars`

The most notable part of this is the `{{ bind-attr src=image}}`, `bind-attr` is used
to bind the attribute of an HTML element to a value of an object. So if we were to 
change the image url of the object you are viewing the `<img>` src attribute would
sync automatically.

Click, on a link in the sidebar, and you should see the plant clicked.