class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :iso
      t.string :long
      t.string :human

      t.timestamps
    end
  end
end
