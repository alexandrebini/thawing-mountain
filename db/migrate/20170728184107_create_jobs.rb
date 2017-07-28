class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :hn_id, null: false
      t.integer :story_id, null: false
      t.string :user, null: false
      t.string :text, null: false
      t.datetime :published_at, null: false
      t.timestamps null: false
    end
    add_index :jobs, :hn_id, unique: true
    add_index :jobs, :story_id
    add_index :jobs, :published_at
  end
end
