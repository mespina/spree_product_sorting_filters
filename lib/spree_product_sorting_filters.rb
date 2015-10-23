require 'spree_core'
require 'spree_product_sorting_filters/engine'

module Spree
  module Sorts
    module_function

    def config(*)
      yield(Spree::Sorts::Config)
    end
  end
end