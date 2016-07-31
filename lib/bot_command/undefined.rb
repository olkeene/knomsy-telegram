module BotCommand
  class Undefined < Base
    def start
      send_message(text: bot_config.unknown_command)
    end
  end
end
