class AddApprovedToCharities < ActiveRecord::Migration[7.0]
  def change
    add_column :charities, :approved, :boolean
  end
end
