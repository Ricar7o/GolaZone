class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter     :set_language
  # before_filter   :set_user_language

  private

  # This function checks to see if the URL has params for the language,
  # otherwise it loads the user's preferences
  def set_language
    I18n.locale = params[:locale] || (current_user.language if user_signed_in?) || "en"
  end

end
