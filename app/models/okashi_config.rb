# RailsSettings Model
class OkashiConfig < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env
end
