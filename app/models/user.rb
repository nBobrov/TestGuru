class User < ApplicationRecord
  #has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, :email, presence: true

  def find_tests_by_level(level)
    tests.where(level: level)
  end
end