require 'dotenv'
require 'twitter'

def login()
  Dotenv.load
  # quelques lignes qui appellent les clés d'API de ton fichier .env
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  
  if client.nil?
    return false
  else
    return client
  end
end

user = login

# ligne qui permet de tweeter sur ton compte
user.update("#bonjour_monde https://www.youtube.com/watch?v=MJTOtrGKEls")
