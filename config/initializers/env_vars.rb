%w(DATABASE_URL BOT_TOKEN).each do |var|
  ENV.fetch(var)
end
