Spree::ProductsHelper.class_eval do
  ##
  # Override cache_key_for_products to add caching per sort param.
  def cache_key_for_products
    count = @products.count
    # Instead of default max_updated_at, we look at the first product in the list
    # And we add sorting, so that we get a product-cache per sorting param
    first_id = @products.any? ? @products.first.id : nil
    sorting = params[:sorting]
    "#{I18n.locale}/#{current_currency}/spree/products/all-#{params[:page]}-#{first_id}-#{sorting}-#{count}"
  end

  def link_to_sort(key)
    if current_sorting?(key)
      css_classes = 'btn btn-primary'
    else
      css_classes = 'btn btn-default'
    end

    link_to Spree.t(key).html_safe, params.merge(sorting: key), class: css_classes
  end

  def current_sorting?(key)
    sorting_param == key.to_sym
  end
end
