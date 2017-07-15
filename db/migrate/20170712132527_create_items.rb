class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false
      t.string  :title
      t.text    :comment
      t.integer :like_count, default: 0
      t.timestamps
    end
  end
end
