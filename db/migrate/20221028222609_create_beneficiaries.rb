class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :stories
      t.float :amount
      t.string :image
      t.belongs_to :charity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
