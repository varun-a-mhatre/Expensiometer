class ShopToItem < ActiveRecord::Migration
  def self.up

	add_column :items, :shop_id, :integer, :default => 1
	add_column :items, :price, :float, :default => 1
	remove_column :products, :shop_id
	remove_column :products, :rate_per_unit

  end

  def self.down

	remove_column :items, :shop_id
	remove_column :items, :price
	add_column :products, :shop_id, :integer
	add_column :products, :rate_per_unit, :integer

  end
end
