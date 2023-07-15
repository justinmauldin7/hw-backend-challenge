require 'bundler/setup'

require_relative 'api'

run API.freeze.app
