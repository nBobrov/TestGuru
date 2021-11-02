class TestPassage < ApplicationRecord
  SUCCESSFUL_PERCENT = 85.freeze
  TIME_DELAY = 600.freeze
  TIME_CHEAT = 6000.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = true if passed?

    save!
  end

  def completed?
    current_question.nil?
  end

  def result
    correct_questions.to_f * 100 / test.questions.count.to_f
  end

  def passed?
    result >= SUCCESSFUL_PERCENT && left_time <= TIME_CHEAT
  end

  def number_current_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def end_time
    (created_at + test.passing_time.minutes).to_f * 1000
  end

  def left_time
    end_time - Time.now.to_f * 1000
  end

  def time_over?
    test.passing_time.present? && (left_time - TIME_DELAY) <= 0
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    (answer_ids && correct_answer.ids.sort == answer_ids.map(&:to_i).sort) || (answer_ids.nil? && correct_answer.count.zero?)
  end

  def correct_answer
    current_question.answers.correct
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
