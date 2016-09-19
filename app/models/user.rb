class User < ApplicationRecord
  validates :telegram_id, presence: true, uniqueness: true

  def save_survey_answer(question_id, answer)
    return unless question_id

    bot_data['answers'] ||= []
    bot_data['answers'].push(id: question_id, answer: answer)

    save!
  end

  def save_question!(question)
    bot_data['current_question_id'] = question[:id]
    save!
  end

  def current_question_id
    bot_data['current_question_id']
  end

  def survey_answers
    bot_data['answers'] || {}
  end

  def reset_survey!
    self.bot_data = {}
    save!
  end
end
