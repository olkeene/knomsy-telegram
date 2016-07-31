source 'https://rubygems.org'

ruby '2.3.1'

# Padrino Stable Gem
gem 'rake'
gem 'padrino', '0.13.2'
gem 'dotenv'

gem 'activerecord', '>= 3.1', require: 'active_record'
gem 'pg'

# gem 'rollbar' # exceptions
gem 'interactor' # service objects

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.2'
# end

gem 'telegram-bot-ruby'

group :development do
  gem 'foreman', require: false
end

group :development, :test do
  gem 'rspec'
  gem 'pry'
end

group :test do
  gem 'fuubar' # specs progress
  gem 'webmock', '~> 2.1.0'
  gem 'database_cleaner'
end
