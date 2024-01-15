module SpreeSeven
  class Engine < Rails::Engine
    require 'spree/core'
    require 'spree/backend'

    isolate_namespace Spree
    engine_name 'spree_seven'

    config.autoload_paths += %W[#{config.root}/lib]

    config.generators do |g| # use rspec for tests
      g.test_framework :rspec
    end

    initializer 'spree_seven.environment', before: :load_config_initializers do |_app|
      Config = Configuration.new
    end

    config.after_initialize do
      Spree::Seven::Config = Spree::SevenSetting.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
