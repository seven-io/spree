module SpreeSeven
  class Configuration < Spree::Preferences::Configuration

   # Some example preferences are shown below, for more information visit:
   # https://dev-docs.spreecommerce.org/internals/preferences

   preference :api_key, :string
   preference :enabled, :boolean, default: true
  end
end
