class CreateJoinTableBillingProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :billings, :products do |t|
      t.index [:billing_id, :product_id]
    end
  end
end
