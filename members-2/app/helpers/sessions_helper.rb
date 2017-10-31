module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    flash[:info] = "You successfully logged in"
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

    # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
    flash[:info] = "You successfully logged out"
  end

  #Only logged in users can go to profile page
    def validate_user
      if !(logged_in?)
        redirect_to root_path
        flash[:warning] = "Log in to see profile page"
      elsif !(current_user[:id].to_s == params[:id])
        flash[:warning] = "Only a logged in user can see its profile page"
        redirect_to root_path
      end
    end

end
