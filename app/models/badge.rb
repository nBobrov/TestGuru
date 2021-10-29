class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :img, :rule_type, presence: true

  TYPES = %i[success_passing_all_tests_from_category success_passing_test_from_the_first_try success_passing_all_tests_of_specified_level].freeze

  scope :with_user, -> (user_id) { joins('LEFT JOIN user_badges ub ON ub.badge_id=badges.id').joins("LEFT JOIN users u ON (u.id = ub.user_id AND u.id = #{user_id})").distinct }
end
