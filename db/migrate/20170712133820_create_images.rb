class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string   :kind
      t.string   :key
      t.string   :ext
      t.string   :original_name
      t.string   :image
      t.integer  :width
      t.integer  :height
      t.integer  :size
      t.string   :imageable_type
      t.integer  :imageable_id
      t.string   :caption
      t.integer  :position
      t.integer  :user_id
      t.timestamps
    end
    add_index :images, :imageable_id
    add_index :images, :user_id
  end
end
