class CreateGoalCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_checkins do |t|
      t.text :content
      t.integer :progress
      t.belongs_to :goal

      t.timestamps
    end
  end
end
