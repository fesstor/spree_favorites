Spree::Product.class_eval do
  has_many :favorites, as: :favorable
  has_many :favorite_users, :through => :favorites, :class_name => 'Spree::User', :source => 'user'

  def self.favorite
    joins(:favorites).uniq
  end

  def cached_favorites_count
    self[:cached_favorites_count].to_i
  end
end