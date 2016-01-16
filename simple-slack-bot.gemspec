$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'simple_slack_bot/version'

Gem::Specification.new do |s|
  s.name = 'simple-slack-bot'
  s.version = SlackBot::VERSION
  s.authors = ['Lee Sun-Hyoup']
  s.email = 'kciter@naver.com'

  s.required_rubygems_version = '>= 2.0.0'
  s.files = `git ls-files -z`.split("\x0")
  s.require_paths = ['lib']

  s.homepage = 'http://github.com/kciter/simple-slack-bot'
  s.licenses = ['MIT']
  s.summary = 'Simple Slack Bot for Ruby.'
  s.description = 'You can easily make Slack Bot!!!'

  s.add_dependency 'slack-ruby-client', '~> 0.5.3'
  s.add_dependency 'eventmachine', '~> 1.0', '>= 1.0.9'
  s.add_dependency 'faye-websocket', '~> 0.10.2'
end