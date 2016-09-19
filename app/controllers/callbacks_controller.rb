class CallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def telegram
    DispatchBotMessageOrganizer.call(params: params)

    head :ok
  end
end
