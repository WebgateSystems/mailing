class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :user_id
      t.string :email
      t.string :lang, :default => 'en'
      t.string :salutation
      t.string :gender, :default => 'male'
      t.string :name
      t.string :surname
      t.string :patronymic

      t.timestamps
    end
  end
end
