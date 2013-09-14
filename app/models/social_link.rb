class SocialLink < ActiveRecord::Base
  attr_accessible :link, :name, :photo

  #macros
  belongs_to :member
  has_attached_file :photo, style: { small:"100x100>", medium:"200x200>", large:"300x300>" }

  #validations
  validates :name, :link, :photo, presence: true
  validates :link, url: true
  validates_attachment :photo, content_type: { content_type: /image/ }, size: { in: 0..50.kilobytes }

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
