class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  attr_accessible :done, :public, :title

  validates :title, :presence => true
end
