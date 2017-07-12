class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.text    :profile
      #t.string  :encrypted_password, default: "", null: false
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
