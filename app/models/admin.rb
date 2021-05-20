class Admin < User
  has_many :author_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
