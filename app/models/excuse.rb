class Excuse < ActiveRecord::Base
  belongs_to :users
  belongs_to :undergrounds
end