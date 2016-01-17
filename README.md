# SimpleSlackBot
[![Build Status](https://travis-ci.org/kciter/simple-slack-bot.svg?branch=master)](https://travis-ci.org/kciter/simple-slack-bot)

This library wrapping [slack-ruby-client](https://github.com/dblock/slack-ruby-client) library

## Preview
<img src="https://github.com/kciter/simple-slack-bot/raw/master/images/preview.gif" alt="Preview gif">

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'simple-slack-bot'
```
And then execute:
```
$ bundle
```
Or install it yourself as:
```
$ gem install simple-slack-bot
```

## Simple Usage
This is simple!
```ruby
require 'simple-slack-bot'

bot = SlackBot::Client.new

bot.configure do |config|
  config.join_message = 'Hello!'
  config.debug = true # 
  config.token = 'YOUR SLACK BOT TOKEN'
end

bot.add_command /Hello/ do |data|
  bot.message(data['channel'], "Hello. <@#{data['user']}>!")
end

bot.start!
```
Refer to the Slack event message for [data](https://api.slack.com/events/message)

## License
The MIT License (MIT)

Copyright (c) 2016 Lee Sun-Hyoup

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
