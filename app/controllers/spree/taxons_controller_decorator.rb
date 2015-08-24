Spree::TaxonsController.class_eval do
  include SortingParams

  alias_method :old_show, :show

  def show
    old_show # Like calling super: http://stackoverflow.com/a/13806783/73673
    @products = @products.send(sorting_scope)
  end
end