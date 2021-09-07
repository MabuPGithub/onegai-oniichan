class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :nendoroid_id
      t.string :nendoroid_name
      t.integer :quantity
      t.decimal :total_price
      t.boolean :deposit, default: false
      t.string :status, default: 'not paid'
      t.string :reason
      t.timestamps
    end
  end
end
