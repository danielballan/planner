class AddClosingTimeToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :closing_time, :datetime
  end
end
