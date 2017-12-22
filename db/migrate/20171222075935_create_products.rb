class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :description
      t.string :gst
      t.string :unit
      t.string :rate
      t.string :discount
      t.string :amount
      t.string :final_amount
      t.string :single_price_rate

      t.timestamps
    end
  end
end
