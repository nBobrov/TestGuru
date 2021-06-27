class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    gist_url = client.call

    if client.success?
      flash[:notice] = "#{t('.success')} #{helpers.link_to t('.open'), gist_url, target: '_blank'}".html_safe
      @test_passage.user.gists.create!(question_id: @test_passage.current_question.id, url: gist_url)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
