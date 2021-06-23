# ChangeHealth

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/change_health`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'changehealth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install changehealth

## Usage

First configure the environment and credentials.

In the .env file, initialize the values:
```ruby
CHANGE_HEALTH_CLIENT_ID=change_health_client_id
CHANGE_HEALTH_SECRET=change_health_secret
```

In a rails app, this might go in `config/initializers/change_health.rb` for example.

```ruby
ChangeHealth.configure do |config|
  config.environment = Rails.env.production? ? :production : :sandbox
  config.client_id = ENV['CHANGE_HEALTH_CLIENT_ID']
  config.client_secret = ENV['CHANGE_HEALTH_SECRET']
  config.persist_token = lambda do |value|
    Rails.cache.write("change_health_access_token", value)
  end
  config.persisted_token = lambda do
    Rails.cache.read("change_health_access_token")
  end
end

```

Access tokens are valid for 3600 seconds (60 minutes) as of this writing. You will need to obtain a new access token if the previous one has expired.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/change_health. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

