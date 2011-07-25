require 'redis_store'

STORE = RedisStore.new

get '/' do
  @tweets = STORE.read
  haml :index
end

get '/update' do
  STORE.write{ Twitter::Search.new.q("freibier").fetch }
  "#{STORE.read.size} new beers"
end
