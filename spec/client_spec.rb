require 'spec_helper'

describe SlackBot::Client do
  describe '#initialize' do
    it 'have an empty commands array' do
      expect(SlackBot::Client.new.commands).to eq []
    end
  end

  describe '.add_command' do
    bot = SlackBot::Client.new

    it 'add command to commands array' do
      result = bot.add_command('Hello')
      expect(result).to eq bot.commands
    end
  end
end
