class Userquest < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  serialize :data, Array
  mount_uploader :photoData, ImgUploader
  paginates_per 3
end
