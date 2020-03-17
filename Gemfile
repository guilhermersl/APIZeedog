source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'

#Guilherme - Allow called from another domains
gem 'rack-cors'

#Guilherme - JWT
gem 'jwt'
gem 'bcrypt', '~> 3.1.7'
gem 'simple_command'
gem 'rest-client'

#group :development, :test do
  gem 'rspec-rails', '~> 3.5'
#end

gem 'rswag'

# Use Postgre as the database for Active Record
#gem 'sqlite3', '~> 1.3.6'
#group :development, :test do
  #gem 'sqlite3', '~> 1.3.6'
#end

#group :production do
  gem 'pg'
#end

#Guilherme - Para permitir mudar nome do controller e da model
#group :development, :test do
  gem 'rails_refactor'
#end

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

#group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
#end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
