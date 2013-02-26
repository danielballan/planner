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

  scope :labeled, lambda { |label_ids|
    joins(:labelings).where('labelings.label_id' => label_ids) unless label_ids.empty?
  }

end
