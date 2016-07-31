module BotCommand
  class Survey < Base
    def start
      user.save_survey_answer(current_question_id, text)

      next_question = find_next_question
      if next_question
        user.save_question!(next_question)
        send_message(text: next_question[:text])
      else
        finish_survey!
      end
    end

    private

    def current_question_id
      user.current_question_id
    end

    def find_next_question
      return bot_config.questions.first unless user.current_question_id # find next question

      # find question
      question = find_question_by_id(user.current_question_id)

      # get next
      if question[:next_question_id]
        find_question_by_id(question[:next_question_id])
      end
    end

    def find_question_by_id(id)
      bot_config.questions.find { |q| q[:id] == id } or raise "Can't find question with id: ##{id}"
    end

    # send emails
    def finish_survey!
      send_message(text: bot_config.finish_message)
      # TODO emails
      # TODO bot msg
    end
  end
end
