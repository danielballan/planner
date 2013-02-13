class Plan < ActiveRecord::Base
  attr_accessible :due, :open, :schedule, :title, :comments
  has_many :comments
end
