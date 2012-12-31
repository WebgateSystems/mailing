class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.integer :user_id
      t.string :lang
      t.string :server
      t.integer :port
      t.string :auth, :default => 'plain'
      t.boolean :starttls, :default => nil
      t.boolean :tls, :default => nil
      t.boolean :ssl, :default => nil
      t.string :openssl_verify_mode, :default => nil
      t.string :encrypted_login
      t.string :encrypted_password
      t.string :encrypted_name
      t.string :encrypted_surname

      t.timestamps
    end
    add_index :user_configs, :user_id
  end
end
