require 'spec_helper'

describe SlackBot::Command do
  describe '#initialize' do
    bot = SlackBot::Client.new

    it 'have a bot_client' do
      command = SlackBot::Command.new(bot)
      expect(command.bot_client).to eq bot
    end
  end

  describe '.match?' do
    bot = SlackBot::Client.new
    bot.add_command('Hello')

    it 'iterate commands' do
      bot.commands.each do |command|
        expect(command.regex).to eq 'Hello'
      end
    end
  end
end
