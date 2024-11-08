<img src="https://www.seven.io/wp-content/uploads/Logo.svg" width="250" />

# SpreeSeven

This gem adds the functionality to send SMS via seven.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    gem 'spree_seven'
    ```

2. Install the gem using Bundler

    ```ruby
    bundle install
    ```

3. Copy & run migrations

    ```ruby
    bundle exec rails g spree_seven:install
    ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Functionalities
### Bulk SMS
Send SMS to all your customers at once.
You can filter by country, to target only customers from a specific country.

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle update
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_seven/factories'
```

## Releasing

```shell
bundle exec gem bump -p -t
bundle exec gem release
```

For more options please see [gem-release REAMDE](https://github.com/svenfuchs/gem-release)

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

##### Support

Need help? Feel free to [contact us](https://www.seven.io/en/company/contact/).

[![MIT](https://img.shields.io/badge/License-MIT-teal.svg)](LICENSE)
