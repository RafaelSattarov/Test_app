class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :period
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
