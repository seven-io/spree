require 'deface'
require 'spree_core'
require 'spree_backend'
require 'spree_extension'
require 'spree_seven/engine'
require 'spree_seven/version'

module Spree
  module Seven
    module_function

    def config(*)
      yield(Spree::Seven::Config)
    end
  end
end