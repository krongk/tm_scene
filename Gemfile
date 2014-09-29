source 'http://ruby.taobao.org'
ruby '2.0.0'

gem 'rails', '4.1.0'
gem 'mysql2', '0.3.13'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'font-awesome-sass'
gem 'compass-rails', "~> 2.0.alpha.0"
gem 'devise'
gem 'cancan'
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'figaro'
gem 'high_voltage'
gem 'pundit'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby
gem 'sitemap_generator'
gem 'sidekiq'
gem 'nokogiri'
gem 'magnific-popup-rails'
#fix error: No source of timezone data could be found. (TZInfo::DataSourceNotFound)
gem 'tzinfo-data'

#for sortable
#handle the error: couldn't find file 'jquery-ui'
#only used for sortable ui
gem 'jquery-ui-rails' 

#add :git to bugfix open dialog error
gem "ckeditor", :git => "git@github.com:galetahub/ckeditor.git"
#File upload
gem 'paperclip'
gem 'paperclip-qiniu'
gem 'jquery-fileupload-rails'
#Excel processing
# gem 'roo', '>=1.11.2' 
# gem 'rubyzip', "~> 0.9.9" #fix the error: cannot load such file -- zip/zipfilesystem

#Queue
gem 'sidekiq'


#Send Mail
#gem 'mailgun'

#Pinyin.t('中国', splitter: '-') => "zhong-guo"
gem 'chinese_pinyin'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_20]
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
end
