module Spree
  class SortSetting < Preferences::Configuration
    preference :allowed_sortings, :array
  end
end
