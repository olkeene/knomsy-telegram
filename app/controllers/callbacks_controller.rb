class CallbacksController < ApplicationController
  def telegram
    DispatchBotMessageOrganizer.call(params: params)

    head :ok
  end
end
