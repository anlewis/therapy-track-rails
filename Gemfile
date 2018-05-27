source 'https://rubygems.org'
ruby '2.4.4'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'coveralls', require: false
gem 'faker', '~> 1.8.7'
gem 'figaro'
gem 'google-api-client', '~> 0.11'
gem 'jquery-rails'
gem 'omniauth-google-oauth2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.1.5'
gem 'rubocop', '~> 0.52.1', require: false
gem 'sass-rails', '~> 5.0'
gem 'loofah', '~> 2.2.1'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'launchy'
  gem 'pry'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]