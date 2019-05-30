class Excuse < ActiveRecord::Base
  belongs_to :users
  belongs_to :trips
  @@excuses = [
    "Sorry I'm late! I had to get off my train as there was a really stinky man",
    "Hey boss! I'm late? sorry fella, there was a bit of a delay",
    "I'm really really really sorry, there was about a thousand people trying to get onto the train",
    "Hey man, I don't know if you saw the news but a travelling band somehow managed to get",
    "I really don't want to talk about it, there was a fleet of wasps",
  ]

  def self.random_excuse
    random_excuse = @@excuses[rand(@@excuses.length)]
  end
end