class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.string :images
      t.integer :price
      t.references :shop_account, foreign_key: true

      t.timestamps
    end
  end
end
