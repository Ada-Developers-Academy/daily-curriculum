# Active Record Relationships

Two classes can be associated to each other through an identifier field (what we call a _foreign _key_ in SQL). If we have two records like the following:

__markets__

|id|name|
|:----:|:-----:|
|1| Cap Hill Market|

__vendors__

|id|name|market_id|
|:----:|:-----:|:---:|
|1| Jules Produce|1|
|2| Verne's Flowers|1|

We would call this a one-to-many association. We would say that Market _has many_ Vendors, and each Vendor _belongs to_ a Market. The `market_id` column for a Vendor corresponds to the `id`
of a Market record.

## Defining an Association

ActiveRecord provides lovely methods to quickly create an association between two (or more!) models. We can use class methods within the models to make the definition.

```ruby
class Market < ActiveRecord::Base
  # plural because many vendors could be associated with this single market
  has_many :vendors
end
```

```ruby
class Vendor < ActiveRecord::Base
  # singular because it belongs to only a single market
  belongs_to :market
end
```

The `Vendor` class would need a `market_id` attribute to store the ID of the associated `Market`.

__Note:__ ActiveRecord does _not_ require a formal `foreign_key` relationship defined at the database level in order to leverage these kind of associations, but it's usually a really good idea to create them in your migrations.

## So what do these associations give us?

A whole slew of nice lookup methods that help us build queries for the associated model. Instead of my talking about them all day, let's head over to our sandbox and make a new app to play with...

```bash
$ git clone git@github.com:jnf/records-example.git
$ cd records-example
$ gem install bundler
$ bundle
$ rake db:setup
```

### belongs_to :market
- `vendor.market`: get the Market associated with this Vendor
- `vendor.market= market_object`: reassign this Vendor to a different Market
- `vendor.build_market(market_hash)`: instantiate a new Market object, associated with this vendor, using the provided hash
- `vendor.create_market(market_hash)`: just like `build_market`, but call `save` after instantiating the Market.

### has_many :vendors
- `market.vendors`: returns an array of all the Vendors associated with this market
- `market.vendors << vendor_object`: associate a Vendor with this market by adding it to the array of vendors
- `market.vendors= vendor_collection`: remove all prior Vendor associations and replace them with a new set of associations
- `market.vendors.find(id)`: find a specific Vendor, scoped to just those associated with this market (not very useful)
- `market.vendors.where(conditions_hash)`: get the Vendors associated with this market that also satisfy the conditions in the `where` hash (much more useful)
- `market.vendors.build(vendor_hash)`: instantiate a new Vendor with the provided attribute hash and associate it with this market
- `market.vendors.create(vendor_hash)`: instantiate a new Vendor with the provided attribute hash
and associate it with this market, then call `save` on the new vendor object.
