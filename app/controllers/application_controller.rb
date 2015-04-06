class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :error, :success, :notice
  include SessionsHelper

  # Store the current url in session's variable
  # 
  # * *Args*    :
  # 
  # * *Returns* :
  #
  def store_location
    cookies[:return_to] = { value: request.fullpath, expires: 1.minute.from_now }
  end

  # Redirect the user to the stored url or the default one provided
  # 
  # * *Args*    :
  #   - default path to redirect to
  # * *Returns* :
  #
  def redirect_back_or(default, message = nil)
    redirect_to(cookies[:return_to] || default, message)
    session.delete(:return_to)
  end

  def authorize_level(level = 5)
    unless current_user && current_user.level <= level
      store_location
      redirect_to login_path, error: t('session.unauthorize')
    end
  end
end
