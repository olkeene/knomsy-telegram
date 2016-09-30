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
      args = { chat_id: user.telegram_id, text: message[:text] }
p message
      if message[:options]
        # args[:reply_markup] = message[:options].map do |answer|
        #   Telegram::Bot::Types::InlineKeyboardButton.new(text: answer)
        # end

        kb = message[:options].each_slice(4).map do |group|
          group.map do |answer|
            Telegram::Bot::Types::KeyboardButton.new(text: answer)
          end
        end
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb, resize_keyboard: false)
        args[:reply_markup] = markup
p args

        # kb = message[:options].map do |answer|
        #   Telegram::Bot::Types::InlineKeyboardButton.new(text: answer)
        # end
        # markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(keyboard: kb)
        # args[:reply_markup] = markup
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
