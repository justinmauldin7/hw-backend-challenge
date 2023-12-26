require 'bundler/setup'

require_relative 'api'

# require 'sidekiq/web'

# #TODO you would run something like this command in here I think to get Sidekiq working
# run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)

# Sidekiq.configure_client do |config|
#   config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
# end

# $redis = Redis.new( url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" )

run API.freeze.app
