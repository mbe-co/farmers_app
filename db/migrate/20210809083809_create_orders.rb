class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :purchase_date
      t.date :due_date
      t.integer :status
      t.decimal :price_products, precision: 14, scale: 2
      t.decimal :delivery_tax, precision: 14, scale: 2
      t.decimal :total, precision: 14, scale: 2

      t.timestamps
    end
  end
end
