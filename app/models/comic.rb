class Comic < ActiveRecord::Base

	include NumberMover

  attr_accessible :image, :title, :number, :permalink

  scope :sorted, order('comics.number ASC')

  mount_uploader :image, ComicUploader

end
