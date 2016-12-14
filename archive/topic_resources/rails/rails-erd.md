# ERD Diagrams

Having an entity-relationship diagram in Rails in a useful tool in understanding the relationships that you have configured.

There is a helpful Gem called `rails-erd` that uses `graphviz` to generate the ERD diagram.

Use the following steps from a Rails project in order to set up to view ERD diagram:
```
brew install graphviz
```

Add `gem rails-erd` to your Gemfile

To generate and view the ERD diagram, run the following commands:
```
bundle install
bundle exec erd
open erd.pdf
```
