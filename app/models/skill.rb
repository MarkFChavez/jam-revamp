class Skill < ActiveRecord::Base
  attr_accessible :name, :photo

  #macros
  belongs_to :member
  has_attached_file :photo, style: { small:"100x100>", medium:"200x200>", large:"300x300>" }

  #validations
  validates :name, :photo, presence: true
  validates_attachment :photo, size: { in: 0..50.kilobytes }, content_type: { content_type: /image/ }

  def self.total_on(date)
    where("date(created_at) = ?", date).count(:id)
  end
  
  def to_param
  	"#{id}-#{name}"
  end
end
