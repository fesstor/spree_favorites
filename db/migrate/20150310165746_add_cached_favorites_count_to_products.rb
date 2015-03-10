class AddCachedFavoritesCountToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :cached_favorites_count, :integer
  end
end
