class CreateNendoroids < ActiveRecord::Migration[6.1]
  def change
    create_table :nendoroids do |t|
      t.string :name
      t.integer :nendoroid_number
      t.string :series
      t.string :simple_description
      t.text :description
      t.decimal :price
      t.date :release_date
      t.decimal :pre_order_price
      t.date :pre_order_date
      t.date :eta
      t.decimal :min_deposit
      t.boolean :availability
      t.timestamps
    end
  end
end
