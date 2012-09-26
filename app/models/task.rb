class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :done, :title, :list

  validates :title, :presence => true
end
