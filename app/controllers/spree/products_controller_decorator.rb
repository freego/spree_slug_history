module Spree
  ProductsController.class_eval do
    append_before_action :redirect_old_slugs, only: :show

    private
    def redirect_old_slugs
      if @product && request.path != product_path(@product)
        return redirect_to @product, status: :moved_permanently
      end
    end
  end
end