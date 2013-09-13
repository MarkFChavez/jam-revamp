class Project < ActiveRecord::Base
  attr_accessible :link, :name

  #macros
  belongs_to :member

  #validations
  validates :name, :link, :member_id, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :link, url: true
  
  def to_param
    "#{id}-#{name}".parameterize
  end
  
end
