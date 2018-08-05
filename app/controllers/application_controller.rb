class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def feedback; end

  def send_feedback
    FeedbackMailer.send_feedback(feedback_params).deliver_now
    redirect_to root_path, notice: t('.feedback')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def admin?
    current_user.is_a?(Admin)
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  private

  def feedback_params
    params.permit(:feedback, :name)
  end
end
