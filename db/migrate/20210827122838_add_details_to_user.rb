class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :balance, :decimal, default: 0
    
  end
end
