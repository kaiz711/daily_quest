class Quest < ActiveRecord::Base
  has_many :userquests
  has_many :users, through: :userquests

end
