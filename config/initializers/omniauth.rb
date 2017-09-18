if Rails.env.development?
  sample_img = "https://d2l930y2yx77uc.cloudfront.net/production/uploads/images/57088/profile_96ce4593fee174807dc2692f75e3c42d.jpg"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    uid: '2015050804',
    info: {
      email:    's2015050804+twitter_test@gmail.com',
      name:     "John Q Public",
      nickname: "johnqpublic",
      image: sample_img,
    },
    credentials: {
      token: 'mock_token',
      secret: 'mock_secret',
      expires_at: Time.now.since(100.days)
    }
  })
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '201709201333',
    info: {
      email:    's201709201333+facebook_test@gmail.com',
      name:     'Kiko Mzhr',
      nickname: 'kiko',
      image: sample_img,
    },
    credentials: {
      token: 'mock_token',
      secret: 'mock_secret',
      expires_at: Time.now.since(100.days)
    }
  })
  Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
end
