source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'interactor', '~> 3'
gem 'foreman', require: false
gem 'telegram-bot-ruby'

# admin
# gem 'remotipart', github: 'mshibuya/remotipart'
# gem 'rails_admin', '>= 1.0.0.rc'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec'
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'fuubar' # specs progress
  gem 'webmock', '~> 2.1.0'
  gem 'database_cleaner'
end
