<p align="center">
  <img src="https://www.seven.io/wp-content/uploads/Logo.svg" width="250" alt="seven logo" />
</p>

<h1 align="center">seven SMS for Spree</h1>

<p align="center">
  Send bulk SMS to your <a href="https://spreecommerce.org/">Spree</a> customers via the seven gateway.
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-teal.svg" alt="MIT License" /></a>
  <img src="https://img.shields.io/badge/Spree-4.x-blue" alt="Spree 4.x" />
  <img src="https://img.shields.io/badge/Ruby-2.7%2B-red" alt="Ruby 2.7+" />
  <a href="https://rubygems.org/gems/spree_seven"><img src="https://img.shields.io/gem/v/spree_seven" alt="Gem" /></a>
</p>

---

## Features

- **Bulk SMS** - Reach all customers in one go
- **Country Filter** - Limit recipients to a specific country
- **Native Spree Engine** - Standard Rails engine that integrates with the Spree admin

## Prerequisites

- A [Spree](https://spreecommerce.org/) installation (Rails 6+)
- A [seven account](https://www.seven.io/) with API key ([How to get your API key](https://help.seven.io/en/developer/where-do-i-find-my-api-key))

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'spree_seven'
```

Install dependencies and run the install generator:

```bash
bundle install
bundle exec rails g spree_seven:install
```

Restart your server so the engine assets are picked up.

## Configuration

After install, paste your seven API key into the Spree admin under the *seven* configuration page (or set `SEVEN_API_KEY` in the environment).

## Development

```bash
bundle update
bundle exec rake
```

`rake` defaults to building the dummy app if it does not exist, then runs specs. Regenerate the dummy app via `rake test_app`.

When testing applications integrating with this gem, load the factories:

```ruby
require 'spree_seven/factories'
```

## Releasing

```bash
bundle exec gem bump -p -t
bundle exec gem release
```

For more options see the [`gem-release`](https://github.com/svenfuchs/gem-release) docs.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for details on installing dependencies and crafting a good pull request.

## Support

Need help? Feel free to [contact us](https://www.seven.io/en/company/contact/) or [open an issue](https://github.com/seven-io/spree/issues).

## License

[MIT](LICENSE)
