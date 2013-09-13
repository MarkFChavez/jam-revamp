class Member < ActiveRecord::Base
  attr_accessible :description, :name, :email, :role

  #macros
  has_many :social_links, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy

  #validations
  validates :name, :email, :role, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def to_param
  	"#{id}-#{name}".parameterize
  end
end
