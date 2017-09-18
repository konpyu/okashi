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
    provider = Provider.find_by(provider: auth[:provider], uid: auth[:uid])
    if user_signed_in?
      if provider.present?
        sign_in_and_redirect provider.user, event: "root"
      else
        current_user.providers.create!(provider_attributes(auth))
        sign_in_and_redirect current_user, event: "root"
      end
    else
      if provider.present?
        sign_in_and_redirect provider.user, event: "root"
      else
        user = User.new
        user.email = auth[:info][:email] || ""
        user.username = SecureRandom.hex(10)
        user.save
        user.providers.create!(provider_attributes(auth))
        sign_in_and_redirect user, event: "root"
      end
    end
  end

  def provider_attributes(auth)
    credentials = auth[:credentials]

    expires_at = (auth[:provider] == "facebook") ? credentials[:expires_at] : nil
    token_secret = (auth[:provider] == "twitter") ? credentials[:secret] : nil
    {
      provider: auth[:provider],
      uid: auth[:uid],
      image_url: auth[:info][:image],
      token: credentials[:token],
      token_expires_at: expires_at,
      token_secret: token_secret,
    }
  end

  def failure
    redirect_to root_path
  end
end
