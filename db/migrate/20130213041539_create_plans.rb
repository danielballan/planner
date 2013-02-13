class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.boolean :open
      t.datetime :due
      t.text :schedule

      t.timestamps
    end
  end
end
