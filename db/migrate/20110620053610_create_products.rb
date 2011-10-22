class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.integer :shop_id
      t.integer :rate_per_unit
      t.integer :calories_per_unit
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
