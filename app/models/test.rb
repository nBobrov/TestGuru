class Test < ApplicationRecord
  class << self
    def find_by_category(title)
      joins('JOIN categories ON tests.category_id = categories.id').where(categories: {title: title}).order(id: :desc).pluck(:title)
    end
  end
end
