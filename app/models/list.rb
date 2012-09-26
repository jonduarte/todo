class List < ActiveRecord::Base
  has_many :tasks

  attr_accessible :done, :public, :title

  validates :title, :presence => true
end
