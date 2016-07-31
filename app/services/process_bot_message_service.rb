class ProcessBotMessageService
  include Interactor

  # {
  #   "update_id"=>174388426,
  #   "message"=>{
  #     "message_id"=>15,
  #     "from"=>{
  #       "id"=>6722898, "first_name"=>"Oleg", "last_name"=>"Keene"
  #     },
  #     "chat"=>{
  #       "id"=>6722898, "first_name"=>"Oleg", "last_name"=>"Keene", "type"=>"private"
  #     },
  #     "date"=>1470080681,
  #     "text"=>"/start",
  #     "entities"=>[{"type"=>"bot_command", "offset"=>0, "length"=>6}]
  #   }
  # }

  before do
    @user    = context.user
    @params  = context.params
    @message = context.params[:message]
  end

  def call
    if (command = BotCommand::Start.new(user, message)).start?
      command.start
    elsif (init = BotCommand::Help.new(user, message)).start?
      init.start
    else
      process_message
    end
  end

  private

  attr_reader :user, :params, :message

  def process_message
    BotCommand::Survey.new(user, message).start
  end

  def unknown_command
    BotCommand::Undefined.new(user).start
  end
end
