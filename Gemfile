source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0.rc1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', github: "rails/sass-rails"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'responders', github: 'plataformatec/responders' # https://github.com/plataformatec/responders A set of Rails responders to dry up your application
gem 'slim' # https://github.com/slim-template/slim
gem 'active_link_to' # https://github.com/comfy/active_link_to View helper to manage "active" state of a link
gem "breadcrumbs_on_rails" # https://github.com/weppos/breadcrumbs_on_rails creating and managing a breadcrumb navigation
# gem "simple-navigation" # https://github.com/codeplant/simple-navigation  creating navigations (with multiple levels) Render your navigation as html list, link list or breadcrumbs.
gem 'best_in_place', github: 'bernat/best_in_place'#, '~> 3.0.1' # https://github.com/bernat/best_in_place A RESTful unobtrusive jQuery Inplace-Editor and a helper as a Rails Gem
# Use jquery as the JavaScript library
gem 'jquery-rails', github: 'rails/jquery-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Use Capistrano for deployment
  gem 'capistrano',  '~> 3.1'
  gem 'capistrano-rvm'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-passenger'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-maintenance', '~> 1.0', require: false
  gem 'capistrano-sidekiq'
  # gem 'rails-footnotes'
  # gem 'better_errors'
  # gem 'annotate'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'

  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'

  ### rspec and friends
  # gem 'rspec-rails'
  ## https://github.com/thoughtbot/shoulda-matchers
  # gem 'shoulda-matchers'
  # gem "factory_girl_rails", "~> 4.0"

  # ## test unit
  # # https://github.com/thoughtbot/shoulda
  # gem 'shoulda'

  gem 'database_cleaner', '~> 1.3.0'

  gem 'mock_redis'
  # http://mailcatcher.me
  # MailCatcher runs a super simple SMTP server which catches any message
  # sent to it to display in a web interface.
  # Run `mailcatcher`, set your favourite app to deliver to smtp://127.0.0.1:1025
  # instead of your default SMTP server,
  # then check out http://127.0.0.1:1080 to see the mail that's arrived so far.
  # gem 'mailcatcher', require: false

  # facker data generator
  # https://github.com/ffaker/ffaker
  gem 'ffaker'

  gem 'ruby-prof'
  gem 'rubocop', require: false
  gem 'flay'#, github: 'seattlerb/flay'
  gem 'ruby2ruby'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
