class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :description
      t.integer :category, default: 0
      t.integer :status, default: 0
      t.belongs_to :charity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
