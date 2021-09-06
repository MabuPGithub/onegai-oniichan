class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.text :address
      t.boolean :deposit
      t.boolean :status
      t.timestamps
    end
  end
end
