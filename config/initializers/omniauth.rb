if Rails.env.development?
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    uid: '2015050804',
    info: {
      email:    's2015050804+twitter_test@gmail.com',
      name:     "John Q Public",
      nickname: "johnqpublic",
    }
  })
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '201709201333',
    info: {
      email:    's201709201333+facebook_test@gmail.com',
      name:     'Kiko Mzhr',
      nickname: 'kiko',
    }
  })
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
end
