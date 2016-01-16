
require 'slack-ruby-client'

module SlackBot
  class Client
    attr_accessor :slack_web_client, :slack_realtime_client
    attr_accessor :commands
    attr_accessor(*Config::ATTRIBUTES)

    def initialize
      @commands = []
    end

    def add_command(regex)
      command = Command.new(self)
      command.regex = regex
      command.action = lambda { |data|
        yield(data)
      }
      @commands << command
    end

    def start!
      if config.token.nil?
        puts 'You must setting a token.'
        return
      end

      self.slack_init
      self.message_event_init

      EM.run do
        @slack_realtime_client.start!
      end
    end

    def config
      Config
    end

    def configure
      block_given? ? yield(Config) : Config
    end

    def web_message(channel, text)
      @slack_web_client.chat_postMessage(channel: channel, text: text, as_user: true)
    end

    def message(channel, text)
      @slack_realtime_client.message channel: channel, text: text
    end

    protected

    def slack_init
      Slack.configure do |config|
        config.token = self.config.token
      end

      Slack::RealTime.configure do |config|
        config.concurrency = Slack::RealTime::Concurrency::Eventmachine
      end

      @slack_web_client = Slack::Web::Client.new
      @slack_realtime_client = Slack::RealTime::Client.new
    end

    def message_event_init
      client = @slack_realtime_client
      client.on :message do |data|
        File.open('bot.log', 'a') { |file| file.write(data.to_s + "\n") }
        puts data if config.debug.eql?(true)

        case data['subtype']
          when 'channel_join' then
            client.message channel: data['channel'], text: config.join_message
        end

        @commands.each do |command|
          if command.match?(data['text'])
            command.execute(data)
          end
        end
      end
    end
  end
end