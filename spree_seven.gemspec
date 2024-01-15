# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_seven/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_seven'
  s.version     = SpreeSeven.version
  s.summary     = 'Send SMS to your customers via seven.'
  s.description = s.summary
  s.required_ruby_version = '>= 3.0'

  s.author    = 'seven communications GmbH & Co. KG'
  s.email     = 'support@seven.io'
  s.homepage  = 'https://github.com/seven-io/spree'
  s.license = 'MIT'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.3.0'
  s.add_dependency 'spree', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'spree_dev_tools'
end
