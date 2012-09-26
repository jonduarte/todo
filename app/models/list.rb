class List < ActiveRecord::Base
  attr_accessible :done, :public, :title

  validates :title, :presence => true
end
