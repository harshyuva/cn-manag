class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.string :name
      t.integer :price
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
