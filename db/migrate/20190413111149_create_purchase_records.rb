class CreatePurchaseRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_records do |t|
      t.references :user, foreign_key: true
      t.integer :product_amount, null: false, default: 0
      t.string :stripe_charge_id, null: false
      t.timestamps
    end
  end
end
