class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :encrypted_subject
      t.text :encrypted_body
      t.string :lang, :default => 'en'
      t.string :inline_image
      t.integer :user_id
      t.integer :distribution_id

      t.timestamps
    end
  end
end
