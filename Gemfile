source 'https://rubygems.org'
#ruby '1.9.3'
gem 'rails', '3.2.13'
#gem 'jruby-openssl'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyrhino'
  gem 'uglifier', '>= 1.0.3'
end
gem 'aws-sdk'
gem 'eventmachine'
gem 'simple_form'
gem 'jquery-rails'
gem 'devise'
gem 'figaro'
gem 'mongoid'
gem 'mizuno'
gem 'docker-api'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
  gem 'mongoid-rspec'
end
