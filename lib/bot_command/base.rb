require 'telegram/bot'

module BotCommand
  class Base
    def initialize(user, message = nil)
      @user    = user
      @message = message
      @api     = Telegram::Bot::Api.new(ENV.fetch('BOT_TOKEN'))
    end

    def start?
      raise NotImplementedError
    end

    def start
      raise NotImplementedError
    end

    protected

    attr_reader :user, :message, :api

    def next_question
      user
    end

    def send_message(message, _options = {})
      api.call('sendMessage', chat_id: user.telegram_id, text: message[:text])
    end

    def text
      message[:text]
    end

    def from
      message[:from]
    end

    def bot_config
      @questions ||= OpenStruct.new(
        YAML.load_file(Rails.root.join('config/bot_config.yml'))
      )
    end
  end
end
