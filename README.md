# Telegram bot
 Telegram bot for https://github.com/olkeene/knomsy

## Transformation steps
```bash
ngrok http 192.168.99.100:3000
ngrok http 192.168.99.100:5000 -subdomain=knomsy_telegram_dev
```

Activate:
https://api.telegram.org/botXXXXX/setWebhook?url=https://70928531.ngrok.io/webhooks/telegram_bot

## How to run
  Run `docker-compose up`

## Hot to test
  1. Run `docker-compose run app bundle exec rspec`
