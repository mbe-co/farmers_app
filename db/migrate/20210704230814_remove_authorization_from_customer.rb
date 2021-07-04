class RemoveAuthorizationFromCustomer < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :authorization, :integer
  end
end
