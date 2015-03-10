class AddCachedFavoritesCountToProductsAndUsers < ActiveRecord::Migration
  def change
    add_column :spree_products, :cached_favorites_count, :integer
    add_column :spree_users,  :cached_favorites_count, :integer
  end
end
