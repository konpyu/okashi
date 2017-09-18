source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'hamlit-rails'
gem 'oj'
gem 'browser'
gem 'aws-sdk'
gem 'addressable'
gem 'bootsnap'
gem 'fast_blank'
gem 'htmlentities'
gem 'httplog'
gem 'rack-attack'
gem 'rack-cors'
gem 'rack-timeout'
gem 'rails-settings-cached'
gem 'sanitize'
gem 'mini_magick'
gem 'rails-settings-cached'
gem 'foreman'
gem 'http_accept_language'
gem 'devise', '~> 4.2'
gem 'devise-two-factor', '~> 3.0'
gem 'sidekiq', '~> 5.0'
gem 'sidekiq-scheduler', '~> 2.1'
gem 'sidekiq-unique-jobs', '~> 5.0'
gem 'sidekiq-bulk', '~>0.1.1'
gem 'listen'
gem 'webpacker'

group :development, :test do
  gem 'fabrication', '~> 2.16'
  gem 'fuubar', '~> 2.2'
  gem 'i18n-tasks', '~> 0.9', require: false
  gem 'pry-rails', '~> 0.3'
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'capybara', '~> 2.14'
  gem 'climate_control', '~> 0.2'
  gem 'faker', '~> 1.7'
  gem 'microformats', '~> 4.0'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'rspec-sidekiq', '~> 3.0'
  gem 'simplecov', '~> 0.14', require: false
  gem 'webmock', '~> 3.0'
  gem 'parallel_tests', '~> 2.14'
end

group :development do
  gem 'active_record_query_trace', '~> 1.5'
  gem 'annotate', '~> 2.7'
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'bullet', '~> 5.5'
  gem 'letter_opener', '~> 1.4'
  gem 'letter_opener_web', '~> 1.3'
  gem 'rubocop', require: false
  gem 'brakeman', '~> 3.6', require: false
  gem 'bundler-audit', '~> 0.5', require: false
  gem 'scss_lint', '~> 0.53', require: false

  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-yarn', '~> 2.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
