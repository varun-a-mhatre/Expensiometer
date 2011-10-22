class CreatePresents < ActiveRecord::Migration
  def self.up
    create_table :presents do |t|
      t.integer :item_id
      t.integer :quantity_left

      t.timestamps
    end
  end

  def self.down
    drop_table :presents
  end
end
