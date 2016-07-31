KnomsyTelegram::App.controllers :webhooks do
  post '/telegram_bot' do
    params = JSON.parse(request.env['rack.input'].read).with_indifferent_access

    DispatchBotMessageOrganizer.call(params: params)
  end
end
