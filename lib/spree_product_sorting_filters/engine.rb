module SpreeProductSortingFilters
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_product_sorting_filters'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      ['app', 'lib'].each do |dir|
        Dir.glob(File.join(File.dirname(__FILE__), "../../#{dir}/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end
    end

    initializer "spree.register.sort_configuration", :before => :load_config_initializers do |app|
      Spree::Sorts::Config = Spree::SortSetting.new
    end

    config.to_prepare &method(:activate).to_proc
  end
end
