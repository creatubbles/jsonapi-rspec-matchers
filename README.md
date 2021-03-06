# WIP: Jsonapi::Rspec::Matchers

This gem allows you  test server responses in JsonAPI format.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'jsonapi-rspec-matchers', github: 'creatubbles/jsonapi-rspec-matchers', require: false
end

# spec/spec_helper.rb

require "jsonapi/rspec/matchers"
```

And then execute:

    $ bundle

## Usage

`jsonapi-rspec-matchers` uses `active_model_serializers` methods to deserialize and compare objects, so it is useful only if you use
`json-api-serializers` gem in your app.


In your rspec files you have now access to additional helpers, which allow you test responses easily. Supported helpers:

### be_valid_json_api_object_response

This matcher compares the object with the attributes specified in your serializer.

```ruby
expect(response).to be_valid_json_api_object_response(object)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creatubbles/jsonapi-rspec-matchers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

