module Spree
  Product.class_eval do
    friendly_id :slug_candidates, use: [:slugged, :history]
  end
end