class Member < ActiveRecord::Base
  attr_accessible :description, :name, :role

  #macros
  has_many :social_links, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
end
