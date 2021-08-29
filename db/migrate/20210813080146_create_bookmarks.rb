class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id, unique: true, null: false
      t.integer :content_id, unique: true, null: false
      t.timestamp :created_at, default: -> { "now()" }, null: false
      t.timestamp :updated_at, default: -> { "now()" }, null: false
      t.timestamps
    end
  end
end
