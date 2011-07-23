require 'redis_store'

STORE = RedisStore.new

get '/' do
  @tweets = STORE.read
  haml :index
end