class CreateMailingRecipients < ActiveRecord::Migration
  def change
    create_table :mailing_recipients do |t|
      t.integer :distribution_id
      t.integer :recipient_id
      t.integer :letter_id
      t.integer :email_status_id, :default => 7

      t.timestamps
    end
  end
end
