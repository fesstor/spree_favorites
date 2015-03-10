module Spree
  class Favorite < ActiveRecord::Base

    FAVORABLES_ALLOWED = [
      'Spree::Product'
    ]

    after_save :update_cached_favorites_count

    belongs_to :favorable, polymorphic: true
    belongs_to :user, class_name: Spree.user_class.to_s

    validates :favorable, presence: true
    validates :favorable_type, presence: true, inclusion: { in: FAVORABLES_ALLOWED }

    validates :user_id, uniqueness: { allow_blank: true, message: 'Already added as favorite.', scope: [:favorable_id, :favorable_type] }
    validates :guest_token, uniqueness: { allow_blank: true, message: 'Already added as favorite.', scope: [:favorable_id, :favorable_type] }

    scope :by_guest_token, -> (token) { where(guest_token: token) }

    default_scope { order('created_at DESC') }

    def update_cached_favorites_count
      self.favorable.cached_favorites_count = self.favorable.favorites.count
      self.favorable.save
    end

  end
end
