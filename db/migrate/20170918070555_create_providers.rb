class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false
      t.string  :provider, null: false
      t.string  :uid, null: false
      t.string  :token, null: false
      t.integer :token_expires_at
      t.string  :token_secret
      t.text    :image_url
      t.timestamps
    end
    add_index :providers, :user_id
    add_index :providers, [:provider, :uid], unique: true
  end
end