class CreateFileattaches < ActiveRecord::Migration
  def change
    create_table :fileattaches do |t|
      t.text :description
      t.string :file
      t.references :attachable

      t.timestamps
    end
    add_index :fileattaches, :attachable_id
  end
end
