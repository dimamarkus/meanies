class Comic < ActiveRecord::Base
  attr_accessible :image, :title, :number, :permalink

  validates :permalink, presence: true,  uniqueness: true

  mount_uploader :image, ComicUploader
end
