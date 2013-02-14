class Plan < ActiveRecord::Base
  attr_accessible :due, :open, :schedule, :title, :comments
  has_many :comments

  def self.search(search, conditions)
    if search
      where('title LIKE ?', "%#{search}%").where(conditions)
    else
      where(conditions)
    end
  end

end
