class FeedbackMailer < ApplicationMailer
  def create(email, title, text)
    @email = email
    @text = text
    mail to:  ENV['FEEDBACK_RECIPIENT_EMAIL'], subject: title
  end
end
