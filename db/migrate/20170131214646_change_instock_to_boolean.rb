class ChangeInstockToBoolean < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :in_stock, :string
  end
end
