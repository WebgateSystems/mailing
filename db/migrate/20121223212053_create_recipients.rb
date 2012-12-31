class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :user_id
      t.string :encrypted_email
      t.string :lang, :default => 'en'
      t.string :salutation
      t.string :gender, :default => 'm'
      t.string :encrypted_name
      t.string :encrypted_surname
      t.string :patronymic

      t.timestamps
    end
  end
end
