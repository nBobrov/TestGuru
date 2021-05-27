module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('helpers.questions_helper.question_header.new', title: question.test.title)
    else
      t('helpers.questions_helper.question_header.edit', title: question.test.title)
    end
  end
end
