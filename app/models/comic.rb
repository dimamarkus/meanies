class Comic < ActiveRecord::Base

	include NumberMover

  attr_accessible :image, :title, :visible

  scope :sorted, order('comics.number ASC')

  mount_uploader :image, ComicUploader

  validates :image,  presence: true
  validates :title,  uniqueness: true, presence: true,  length: { maximum: 32 }


  def to_params
  	"#{number.parameterize}"
  end

end
