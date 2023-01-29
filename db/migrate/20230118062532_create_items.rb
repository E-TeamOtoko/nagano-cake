class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, null: false, foreign_key: true
      t.string :item_name, null: false
      t.text :item_introduction, null: false
      t.integer :tax_excluded_price, null: false, index: true
      t.boolean :sales_status, null: false, default: true
      t.timestamps
    end
  end
end