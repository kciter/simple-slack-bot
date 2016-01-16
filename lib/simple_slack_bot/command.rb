
module SlackBot
  class Command
    attr_accessor :bot_client
    attr_accessor :regex
    attr_accessor :help_message
    attr_accessor :action

    def initialize(bot_client)
      @bot_client = bot_client
    end

    def match?(str)
      return false if @regex.nil? || @regex.match(str).nil?
      true
    end

    def execute(data)
      return if @action.nil?
      @action.call(data)
    end
  end
end