source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'friendly_id', '5.2.1'
gem 'graphiql-rails', '1.4.2'
gem 'graphql', '1.6.6'
gem 'httparty', '0.15.6'
gem 'memoist', '0.16.0'
gem 'pg', '0.21.0'
gem 'puma', '3.9.1'
gem 'rails', '5.1.2'
gem 'react-rails', '2.2.1'
gem 'redis', '3.3.3'
gem 'sucker_punch', '2.0.2'
gem 'turbolinks', '5.0.1'
gem 'tzinfo-data', platforms: %i[mingw mswin jruby x64_mingw]
gem 'uglifier', '3.2.0'
gem 'webmock', '3.0.1'
gem 'webpacker', '2.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'guard-bundler', '~> 2.1'
  gem 'guard-bundler-audit', '~> 0.1.4'
  gem 'guard-rspec', '~> 4.7'
  gem 'guard-rubocop', '~> 1.3'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver', '~> 3.4'
end

group :test do
  gem 'database_cleaner', '~> 1.6'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'faker', '~> 1.8'
  gem 'rspec-its', '~> 1.2'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'vcr', '~> 3.0'
end

group :development do
  gem 'foreman', '~> 0.84.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
