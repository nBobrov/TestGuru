class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  #has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

  class << self
    def find_by_category(title)
      joins(:category).where(categories: {title: title}).order(id: :desc).pluck(:title)
    end
  end
end
