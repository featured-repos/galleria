class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:warning] = "You must be logged in to do that."
      redirect_to login_path
    end
  end

  def render_404
    render template: "errors/error_404", status: 404
  end

end
