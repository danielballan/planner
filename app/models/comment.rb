class Comment < ActiveRecord::Base
  attr_accessible :prose
  belongs_to :plan
end
