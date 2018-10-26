class AddOrderUrlToCd < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :order_url, :string
  end
end
