class Plan < ActiveRecord::Base
  attr_accessible :due, :open, :schedule, :title, :comments, :closing_time, :label_ids
  has_many :comments, :dependent => :destroy
  has_many :labelings
  has_many :labels, :through => :labelings

  accepts_nested_attributes_for :labels, :comments

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  scope :labeled, lambda { |label| joins(:labels).where("labels.id = ?", label) }

end
