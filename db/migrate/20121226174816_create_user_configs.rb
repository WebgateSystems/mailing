class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.integer :user_id
      t.string :lang
      t.string :server
      t.integer :port
      t.string :login
      t.string :password

      t.timestamps
    end
    add_index :user_configs, :user_id
  end
end
