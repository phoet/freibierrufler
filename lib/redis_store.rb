require 'base64'
require 'redis'

class RedisStore
  def initialize
    @redis = Redis.connect(:url => ENV['RAILS_REDIS_CACHE_URL'] || ENV['REDISTOGO_URL'])
  end
  
  def read_entry(key)
    raw_value = @redis.get key
    return nil unless raw_value
    Marshal.load(Base64.decode64(raw_value))
  end

  def write_entry(key)
    value = Base64.encode64(Marshal.dump(yield))
    @redis.set key, value
  end
end