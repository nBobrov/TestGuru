class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :img, :rule_type, presence: true

  TYPES = %i[all_tests_from_category first_try all_tests_of_specified_level].freeze

  default_scope { order(id: :asc) }
end
