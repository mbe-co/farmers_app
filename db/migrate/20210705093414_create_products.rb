class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :status

      t.timestamps

    end
    add_index :products, :name, unique: true
  end
end
