require 'bundler/setup'
Bundler.setup

require 'simple-slack-bot'

RSpec.configure do |config|
end

SlackBot.configure do |config|
  config.join_message = 'Hello!'
  config.debug = true
  config.token = ENV['SLACK_API_TOKEN']
end