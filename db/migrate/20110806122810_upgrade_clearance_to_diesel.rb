class UpgradeClearanceToDiesel < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.rename :password_digest, :encrypted_password
      t.change :encrypted_password, :string, :limit => 128
      t.string :salt, :limit => 128
      t.string :confirmation_token, :limit => 128
      t.string :remember_token, :limit => 128

      t.string :role
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
