Rails.application.routes.draw do
  post 'telegram_bot', to: 'callbacks#telegram'
end
