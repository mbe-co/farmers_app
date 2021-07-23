class ChangeCepForZipcodeOnAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :cep, :zipcode
  end
end
