require 'base64'
require 'redis'

class RedisStore
  
  KEY = "freibierrufler_tweets"
  
  def initialize
    @redis = Redis.connect(:url => ENV['RAILS_REDIS_CACHE_URL'] || ENV['REDISTOGO_URL'])
  end
  
  def read
    raw_value = @redis.get KEY
    return [] unless raw_value
    Marshal.load(Base64.decode64(raw_value))
  end

  def write
    value = Base64.encode64(Marshal.dump(yield))
    @redis.set KEY, value
  end
end