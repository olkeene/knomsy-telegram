module BotCommand
  class Help < Base
    def start?
      return true if text =~ /\A\/help/
      return true if text.empty? && user.survey_answers.empty?
      return true if (user.survey_answers || []).size >= bot_config.questions.size

      false
    end

    def start
      send_message(text: bot_config.welcome_message)
    end
  end
end
