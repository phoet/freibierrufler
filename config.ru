$:.unshift ::File.join(::File.dirname(__FILE__), 'lib')
$:.unshift ::File.join(::File.dirname(__FILE__), '.')

require 'rubygems'
require 'bundler'
require 'hashie'
require 'clock' # try to run the worker within the web-process

Bundler.require

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

require 'freibierrufler'
run Sinatra::Application
