class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :done, :title, :list

  validates :title, :presence => true

  after_update :mark_list_as_done

  private
  def mark_list_as_done
    if self.list.completed?
      self.list.done = true
    elsif !self.list.completed? && self.list.done?
      self.list.done = false
    end
    self.list.save
  end
end
