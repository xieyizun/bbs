module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  #setter
  def current_user=(user)
    @current_user = user
  end

  #getter
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_in?
    return !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def sign_in_user
    unless sign_in?
      redirect_to signin_path, notice: 'please sign in first'
    end
  end
end
