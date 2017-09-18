class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    omniauth_authorize
  end

  def twitter
    omniauth_authorize
  end

  private

  def omniauth_authorize
    auth = request.env["omniauth.auth"]
    if user_signed_in?
      # add new connection
      omni_params = request.env["omniauth.params"]
      redirect_path = omni_params["redirect_to"].presence || root_path
      redirect_to root_path and return
    else
      user = User.where(
        provider: auth[:provider],
        uid: auth[:uid]
      ).first_or_initialize
      if user.new_record?
        user.email = auth[:info][:email]
        user.username = SecureRandom.hex(10)
        user.save
      end
      sign_in_and_redirect user, event: "root"
    end
  end

  def failure
    redirect_to root_path
  end
end
