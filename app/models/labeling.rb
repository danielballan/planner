class Labeling < ActiveRecord::Base
  attr_accessible :created_at, :label_id, :plan_id
  belongs_to :label
  belongs_to :plan
end
