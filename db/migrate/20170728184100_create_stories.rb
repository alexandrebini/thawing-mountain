class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.integer :hn_id, null: false
      t.string :title, null: false
      t.datetime :published_at, null: false
      t.string :slug, null: false
      t.timestamps null: false
    end
    add_index :stories, :hn_id, unique: true
    add_index :stories, :slug, unique: true
    add_index :stories, :published_at
  end
end
