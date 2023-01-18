class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :item_name, null: false
      t.integer :tax_excluded_price, null: false, index: true
      t.integer :sales_status, null: false, default: 1
      t.timestamps
    end
  end
end
