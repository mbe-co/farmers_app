class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :quantity, precision: 14, scale: 2
      t.decimal :price, precision: 14, scale: 2

      t.timestamps
    end
  end
end
