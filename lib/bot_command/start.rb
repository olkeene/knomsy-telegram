module BotCommand
  class Start < Base
    def start?
      text =~ /\A\/start/
    end

    def start
      user.reset_survey!

      Survey.new(user, message).start
    end
  end
end
