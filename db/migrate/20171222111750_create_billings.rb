class CreateBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :billings do |t|
      t.string :purchase_name
      t.string :bill_number
      t.date :bill_date
      t.string :total_amount

      t.timestamps
    end
  end
end
