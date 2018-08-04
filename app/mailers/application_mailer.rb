class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@testsguru.com>}
  layout 'mailer'

  def send_feedback(feedback_params)
    @feedback = feedback_params[:feedback]
    @name = feedback_params[:name]
    @admin = Admin.first
    mail to: @admin.email
  end
end
