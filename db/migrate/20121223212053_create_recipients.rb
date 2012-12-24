class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :email
      t.string :lang, :default => 'en'
      t.string :gender, :default => 'male'
      t.string :salutation
      t.string :name
      t.string :patronymic
      t.string :surname

      t.timestamps
    end
  end
end
