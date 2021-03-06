class TestPassage < ApplicationRecord
  SUCCESSFUL_PERCENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_end_time, on: :create
  before_update :before_update_next_question

  scope :passed, -> { where(level: 2..4) }

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    if passed?
      self.passed = true
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result
    correct_questions.to_f*100/test.questions.count.to_f
  end

  def passed?
    result >= SUCCESSFUL_PERCENT
  end

  def number_current_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    (answer_ids && correct_answer.ids.sort == answer_ids.map(&:to_i).sort) || (answer_ids.nil? && correct_answer.count == 0)
  end

  def correct_answer
    current_question.answers.correct
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_end_time
    self.end_time = (Time.now + test.passing_time.minutes).to_f * 1000   if test.passing_time > 0
  end
end
