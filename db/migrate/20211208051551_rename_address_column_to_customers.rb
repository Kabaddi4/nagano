class RenameAddressColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :address, :customer_address
    
  end
end
