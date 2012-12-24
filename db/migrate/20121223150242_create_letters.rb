class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :body
      t.string :lang, :default => 'en'
      t.string :inline_image
      t.integer :distribution_id

      t.timestamps
    end
  end
end
