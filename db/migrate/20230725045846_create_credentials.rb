class CreateCredentials < ActiveRecord::Migration[7.1]
  def change
    create_table :credentials do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: {unique: true}
      t.string :token, null: false
      t.string :refresh_token, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
    add_index :credentials, :token, unique: true
  end
end
