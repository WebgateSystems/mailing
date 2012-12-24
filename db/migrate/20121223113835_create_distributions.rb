class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :title
      t.integer :status_id, :default => 1

      t.timestamps
    end
  end
end
