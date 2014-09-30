class CreateCurrentSlugHistoryForProduct < ActiveRecord::Migration
  def up
    Spree::Product.all.each do |product|
      product.update_attribute(:slug, product.slug)
    end if Spree::Product.any?
  end

  def down
    execute "DELETE FROM friendly_id_slugs"
  end
end
