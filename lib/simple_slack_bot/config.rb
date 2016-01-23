module SlackBot
  module Config
    module_function

    ATTRIBUTES = [
      :debug,
      :join_message,
      :token
    ]

    attr_accessor(*Config::ATTRIBUTES)

    self.debug = false
    self.join_message = 'Hello!'
    self.token = 'TOKEN'
  end

  def configure
    block_given? ? yield(Config) : Config
  end

  def config
    Config
  end
end
