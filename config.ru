$:.unshift ::File.join(::File.dirname(__FILE__), 'lib')

require 'rubygems'
require 'bundler'
require 'hashie'

Bundler.require

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

require 'freibierrufler'
run Sinatra::Application
