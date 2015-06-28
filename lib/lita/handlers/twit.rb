require "twitter"
module Lita
  module Handlers
    class Twit < Handler
      config :consumer_key, type: String, required: true
      config :consumer_secret, type: String, required: true
      config :access_token, type: String, required: true
      config :access_token_secret, type: String , required: true
      
      route(/^tw(?:eet|itter)?\s+(\w+)/i, :user_tweet, command: true,
            help: {t("help.twit_key") => t("help.twit_value")}) 
            
      route(/^tw(?:it)?\s+(\w+)/i, :twit, command: true,
            help: {"twit" => "twit status"})      
                 
      
      def initialize(robot)
        super
        @client = Twitter::REST::Client.new do |config|
          config.consumer_key = Lita.config.handlers.tweeta.consumer_key
          config.consumer_secret = Lita.config.handlers.tweeta.consumer_secret
          config.access_token = Lita.config.handlers.tweeta.access_token
          config.access_token_secret = Lita.config.handlers.tweeta.access_token_secret
        end        
      end
      
      def twit(response)
        text = response.message.body
        response.reply post_twit(text)
      end
      
      def user_tweet(response)
        username = response.matches.first.first
        if @client.user?(username)
          user = @client.user(username)
          tweets = @client.user_timeline(user, {count: 1, include_rts: false})
          unless tweets.empty?
            response.reply format(tweets.first)
          end
        end
      end      
      
      private
      def post_twit(text)
        client = @client.update(text.gsub("twit", ""))
        return client.user.name + " twit: " + client.text        
      end
      def format(tweet)
        "\"#{tweet.text}\" --#{tweet.user.name}, #{tweet.created_at.strftime('%F')}"
      end
    end

    Lita.register_handler(Twit)
  end
end
