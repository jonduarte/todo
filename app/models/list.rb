class List < ActiveRecord::Base
  attr_accessible :done, :public, :title

  has_many :tasks
  belongs_to :user
  has_and_belongs_to_many :favoriteds, :class_name => "User"


  validates :title, :presence => true

  def completed?
    tasks.map(&:done).all?
  end

  def self.public_for(user)
    favorites = user.favorites.map(&:id)
    if favorites.present?
      self.where("public = ? and user_id <> ? and id not in (?)", true, user.id, favorites)
    else
      self.where("public = ? and user_id <> ?", true, user.id)
    end
  end
end
