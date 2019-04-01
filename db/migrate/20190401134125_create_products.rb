class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price
      t.text :description
      t.integer :status, null: false, default: 0
      t.integer :selllimit

      t.timestamps
    end
  end
end
