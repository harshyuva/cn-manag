class AddColumnToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts ,:all_amount ,:integer
  end
end
