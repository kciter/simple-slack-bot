require 'spec_helper'

describe SlackBot::Config do
  describe '#initialize' do
    it 'sets config' do
      expect(SlackBot::config.join_message).to eq 'Hello!'
      expect(SlackBot::config.debug).to eq false
      expect(SlackBot::config.token).to eq 'TOKEN'
    end
  end

  describe '#configure' do
    before do
      SlackBot.configure do |config|
        config.join_message = 'Hi!'
        config.debug = true
        config.token = 'Invalid Token'
      end
    end

    it 'sets config' do
      expect(SlackBot.config.join_message).to eq 'Hi!'
      expect(SlackBot.config.debug).to eq true
      expect(SlackBot.config.token).to eq 'Invalid Token'
    end
  end
end