Spree::ProductsController.class_eval do
  include SortingParams

  alias_method :old_index, :index

  def index
    old_index # Like calling super: http://stackoverflow.com/a/13806783/73673
    @products = @products.send(sorting_scope)
  end
end
