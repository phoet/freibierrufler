$:.unshift ::File.join(::File.dirname(__FILE__), 'lib')

require 'rubygems'
require 'bundler'

Bundler.require

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

require 'freibierrufler'
run Sinatra::Application
