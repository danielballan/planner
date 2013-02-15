class CreateLabelings < ActiveRecord::Migration
  def change
    create_table :labelings do |t|
      t.integer :plan_id
      t.integer :label_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
