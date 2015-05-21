class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_authenticated
    #flash[:warning] = 'You have to authenticate to access this page.'
    redirect_to login_path
  end
end
