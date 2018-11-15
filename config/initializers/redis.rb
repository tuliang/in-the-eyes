require "redis"

$redis = Redis.new(url: ENV["redis_url"])