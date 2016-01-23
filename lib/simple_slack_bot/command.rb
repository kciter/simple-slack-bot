module SlackBot
  class Command
    attr_accessor :bot_client, :regex, :help_message, :action

    def initialize(bot_client)
      @bot_client = bot_client
    end

    def match?(str)
      (@regex.nil? || @regex.match(str).nil?) ? true : false
    end

    def execute(data)
      return if @action.nil?
      @action.call(data)
    end
  end
end
