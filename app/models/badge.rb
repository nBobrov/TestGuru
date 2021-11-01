class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :img, :rule_type, presence: true

  TYPES = %i[all_tests_from_category first_try all_tests_of_specified_level].freeze

  scope :with_user, -> (user_id) {
    joins("LEFT JOIN user_badges ub ON (ub.badge_id=badges.id AND ub.user_id = #{user_id})").distinct
                                                                                            .order(id: :asc) }
end
