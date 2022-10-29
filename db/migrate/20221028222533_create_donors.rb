class CreateDonors < ActiveRecord::Migration[7.0]
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.datetime :reminder
      t.string :mode_of_donation
      t.integer :status
      t.integer :donate
      t.timestamps
    end
  end
end
