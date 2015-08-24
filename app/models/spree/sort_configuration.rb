module Spree
  class SortConfiguration < Preferences::Configuration
    attr_accessor :allowed_sortings

    def initialize
      @allowed_sortings = []
    end
  end
end
