require 'redis_store'

STORE = RedisStore.new

get '/' do
  puts @tweets = STORE.read
  haml :index
end