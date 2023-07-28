class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :spotify_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :country
      t.string :profile_picture

      t.timestamps
    end
    add_index :users, :spotify_id, unique: true
  end
end
