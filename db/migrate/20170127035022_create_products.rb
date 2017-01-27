class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.text :description
      t.string :in_stock
      t.string :boolean

      t.timestamps
    end
  end
end
