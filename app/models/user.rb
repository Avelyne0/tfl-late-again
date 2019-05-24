class User < ActiveRecord::Base
  has_many :excuses
end