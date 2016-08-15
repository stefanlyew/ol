source 'https://rubygems.org'

gem 'rake', '~> 11.2', '>= 11.2.2'
gem 'sinatra', '~> 1.4', '>= 1.4.7', require: 'sinatra/base'
gem 'sinatra-contrib', '~> 1.4', '>= 1.4.6', require: false
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.9'

gem 'smarter_csv', '~> 1.1'
gem 'activerecord-import', '~> 0.15.0'

gem 'kaminari', '~> 0.17.0'
gem 'kaminari-sinatra', '~> 0.1.0'

gem 'thin', '~> 1.7'

group :development do
 gem 'sqlite3'
 gem 'tux'
end

group :production do
 gem 'pg'
end

group :test do
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem "factory_girl", "~> 4.0"
  gem 'rack-test', require: false
  gem 'rspec', '~> 3.5'
end

group :development, :test do
  gem 'pry'
end

