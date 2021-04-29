module QuestionsHelper
  def question_header(question)
    if question.id.nil?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title}  Question"
    end
  end
end
