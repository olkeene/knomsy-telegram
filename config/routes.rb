Rails.application.routes.draw do
  get 'webhooks/telegram_bot'

  post 'webhooks/telegram_bot', to: 'callbacks#telegram'
end
