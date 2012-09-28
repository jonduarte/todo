class List < ActiveRecord::Base
  attr_accessible :done, :public, :title

  has_many :tasks
  belongs_to :user

  scope :public_for, lambda { |user| where("public = ? and user_id <> ?", true, user.id) }

  validates :title, :presence => true
end
