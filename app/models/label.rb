class Label < ActiveRecord::Base
  attr_accessible :name
  has_many :labelings
  has_many :labels, :through => :labelings
end
