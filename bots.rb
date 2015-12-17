require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = 'D7egHfxGPkU7fh0wjWvWPvNtD' # Your app consumer key
    self.consumer_secret = '3ytIQtPL6DGeUKaZducJThOyV1XeWlxFDEP47VbnjJkQsLwI2f' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '12h' do
        statement = model.make_statement(140)
        tweet(statement)
    end
  end

  def on_message(dm)
    # Reply to a DM
      reply(dm, "you've never even been to oovoo javer")
  end

  def on_follow(user)
    # Follow a user back
    follow(user.screen_name)
  end

  def on_mention(tweet)
    # Reply to a mention
      statement= model.make_statement(120)
      reply(tweet, statement)
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end
    
    def load_model!
    return if @model

    @model_path ||= "model/#{original}.model"

    log "Loading model #{model_path}"
    @model = Ebooks::Model.load(model_path)
  end
end

# Make a MyBot and attach it to an account
MyBot.new("danika_ebooks") do |bot|
  bot.access_token = "4517864127-xwOtiCkJe8zlSdquwHRtr4kxetrY70E08KVqYay" # Token connecting the app to this account
  bot.access_token_secret = "w2rCquuKuqjoWANLCgqRaW5NSv7vLSkH6ii5FFsQgC2N8" # Secret connecting the app to this account
    
    
end
