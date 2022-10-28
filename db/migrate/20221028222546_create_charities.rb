class CreateCharities < ActiveRecord::Migration[7.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :description
      t.float :amount_donated
      t.float :target_amount
      t.integer :category, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
