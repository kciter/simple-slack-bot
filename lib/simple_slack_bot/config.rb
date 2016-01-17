
module SlackBot
  module Config
    extend self

    ATTRIBUTES = [
        :debug,
        :join_message,
        :token
    ]

    def reset
      self.debug = false
      self.join_message = 'Hello!'
    end

    attr_accessor(*Config::ATTRIBUTES)
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end

SlackBot::Config.reset()