class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :find_by_category, -> (title) { joins(:category).where(categories: {title: title}) }

  class << self
    def get_tests_title_by_category(title)
      find_by_category(title).order(id: :desc).pluck(:title)
    end
  end

  private

  def set_user
    @user = User.first
  end

end
