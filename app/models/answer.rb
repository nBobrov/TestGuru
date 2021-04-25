class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_max_answer, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_max_answer
    errors.add :base, "You have added maximum(4) answer for question #{question.body}" if question.answers.count >= 4
  end
end
