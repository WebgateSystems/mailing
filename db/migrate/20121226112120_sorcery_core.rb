class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email,            :null => false # if you use this field as a username, you might want to make it :null => false.
      t.string :crypted_password, :null => false
      t.string :salt,             :default => nil
      t.string :remember_me_token, :default => nil
      t.datetime :remember_me_token_expires_at, :default => nil
      t.boolean :admin,           :default => false
      t.boolean :active,          :default => true
      t.string :encryption_salt
      t.timestamps
    end
    add_index :users, :remember_me_token
  end

  def self.down
    drop_table :users
  end
end