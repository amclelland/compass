class CreateMeeting < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
end