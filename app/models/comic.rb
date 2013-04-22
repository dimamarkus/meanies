class Comic < ActiveRecord::Base

	include NumberMover

  attr_accessible :image, :title

  scope :sorted, order('comics.number ASC')

  mount_uploader :image, ComicUploader

  validates :image,  presence: true
  validates :title,  presence: true,  length: { maximum: 50 }

  def to_params
  	"#{number.parameterize}"
 	end

end
