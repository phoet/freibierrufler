$:.unshift ::File.join(::File.dirname(__FILE__), 'lib')
require 'clockwork'
require 'twitter'
require 'redis_store'

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

include Clockwork

STORE = RedisStore.new

handler do |job|
  puts "Running #{job}"
  # yeah, it's not supposed to work this way...
  STORE.write{ Twitter::Search.new.q("freibier").fetch }
  puts "#{store.read.size} new entries"
end

every(300.seconds, 'freibieeeer!')

