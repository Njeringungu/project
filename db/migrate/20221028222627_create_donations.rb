class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.float :amount
      t.belongs_to :charity, null: false, foreign_key: true
      t.belongs_to :donor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
