class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.integer :user_id, null: false
      t.integer :content_id, null: false
      t.integer :follow_user_id, null: false
      t.timestamp :created_at, default: -> { "now()" }, null: false
      t.timestamp :updated_at, default: -> { "now()" }, null: false
      t.timestamps
    end
  end
end
