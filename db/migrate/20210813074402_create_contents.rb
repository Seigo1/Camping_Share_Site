class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.text :introduction, null: false
      t.float :latitude, default: 0, null: false
      t.float :longitude, default: 0, null: false
      t.string :content_image_id
      t.integer :review, default: 0, null: false
      t.timestamp :created_at, default: -> { "now()" }, null: false
      t.timestamp :updated_at, default: -> { "now()" }, null: false
      t.timestamps
    end
  end
end
