class Post < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  
  belongs_to :user
  validates_presence_of :title, :content, :theme, :quest_id, :status
  
  paginates_per 10
  
  
end
