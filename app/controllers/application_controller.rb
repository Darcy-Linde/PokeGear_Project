class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    user_id = session[:user_id]
    if user_id.present?
      Trainer.find(user_id)
    end
  end

  def authorize!
    unless current_user
      redirect_to login_path
    end
  end
end
