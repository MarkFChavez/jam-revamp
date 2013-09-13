class Skill < ActiveRecord::Base
  attr_accessible :member_id, :name, :photo

  #macros
  belongs_to :member
  has_attached_file :photo, style: { small:"100x100>", medium:"200x200>", large:"300x300>" }
end
