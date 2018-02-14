module Authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to new_session_path unless current_user
  end

  def init_session_for(user)
    session[:user_id] = user.id
  end

  def self.included(base)
    base.class_eval do
      helper_method :current_user
    end
  end
end