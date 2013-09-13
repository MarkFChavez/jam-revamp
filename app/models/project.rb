class Project < ActiveRecord::Base
  attr_accessible :link, :member_id, :name

  #macros
  belongs_to :member
end
