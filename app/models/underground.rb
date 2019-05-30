require 'pry'

class Underground < ActiveRecord::Base
  has_many :excuses
  has_many :users, through: :excuses



end
