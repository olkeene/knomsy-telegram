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
      args = {
        chat_id: user.telegram_id,
        text: message[:text],
        reply_markup: Telegram::Bot::Types::ReplyKeyboardHide.new(hide_keyboard: true)
      }

      if message[:options]
        kb = message[:options].each_slice(3).map do |group|
          group.map do |answer|
            Telegram::Bot::Types::KeyboardButton.new(text: answer)
          end
        end
        args[:reply_markup] = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: kb,
          resize_keyboard: true,
          one_time_keyboard: true
        )
      end

      api.call('sendMessage', args)
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
