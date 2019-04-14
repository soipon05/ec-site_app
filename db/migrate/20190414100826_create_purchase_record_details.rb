class CreatePurchaseRecordDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_record_details do |t|
      t.references :purchase_record, foreign_key: true
      t.references :product, foreign_key: true
      t.string :product_name
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
