# UsdaNdb

A ruby gem wrapping API of USDA National Nutrient Database.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'usda_ndb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usda_ndb

## Usage

Visit http://ndb.nal.usda.gov/ndb/api/doc and get a free data.gov API key. Then create initializer

    $ rails generate usda_ndb:install

and set your key in /config/initializers/usda_ndb.rb.

```ruby
UsdaNdb.configure do |config|
  config.api_key = 'Your API key'
end
```

Then you can use it.

```ruby
# to get nutrition data about product with concrete id(ndbno)
UsdaNdb.reports('01208')
# => {"report"=>{"sr"=>"28", "type"=>"Basic", "food"=>{"ndbno"=>"01208", "name"=>"Cheese, provolone, reduced fat", "nutrients"=>[{"nutrient_id"=>"255", "name"=>"Water", ...

# to search for products
UsdaNdb.search('cheese')
# => {"list"=>{"q"=>"cheese", "sr"=>"28", "start"=>0, "end"=>150, "total"=>312, "group"=>"", "sort"=>"r", "item"=>[{"offset"=>0, "group"=>"Dairy and Egg Products", "name"=>"Cheese spread, cream cheese base", "ndbno"=>"43276"}, ...

# to list products
UsdaNdb.list
# => {"list"=>{"lt"=>"f", "start"=>0, "end"=>50, "total"=>50, "sr"=>"28", "sort"=>"n", "item"=>[{"offset"=>0, "id"=>"09427", "name"=>"Abiyuch, raw"}, {"offset"=>1, "id"=>"09002", "name"=>"Acerola juice, raw"}, ...
```

You can specify additional params. A reference is [here](http://ndb.nal.usda.gov/ndb/api/doc)

```ruby
# to list product groups instead of products
UsdaNdb.list(lt: 'g')
# => {"list"=>{"lt"=>"g", "start"=>0, "end"=>25, "total"=>25, "sr"=>"28", "sort"=>"n", "item"=>[{"offset"=>0, "id"=>"3500", "name"=>"American Indian/Alaska Native Foods"}, {"offset"=>1, "id"=>"0300", "name"=>"Baby Foods"}, ...
```

## Contributing

1. Fork it ( https://github.com/aTeapot/usda_ndb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
