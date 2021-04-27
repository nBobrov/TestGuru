class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index

  end

  def show
    render plain: "Question: #{@question.body}"
  end

  def new

  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: 'Question has been created successfully'
    else
      render inline: question.errors.full_messages.join('<br/>')
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question has been deleted successfully'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
