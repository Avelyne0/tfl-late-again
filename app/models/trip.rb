class Trip < ActiveRecord::Base
  belongs_to :users
  belongs_to :excuses
end
