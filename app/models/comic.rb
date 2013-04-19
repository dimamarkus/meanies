class Comic < ActiveRecord::Base

	include NumberMover

  attr_accessible :image, :title

  scope :sorted, order('comics.number ASC')

  mount_uploader :image, ComicUploader

  def to_params
  	"#{number.parameterize}"
 	end

end
