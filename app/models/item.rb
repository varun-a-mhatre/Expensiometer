class Item < ActiveRecord::Base

belongs_to :product
belongs_to :shop
has_many :presents, :dependent => :destroy
accepts_nested_attributes_for :presents, :reject_if => lambda { |a| a[:quantity_left].blank? }, :allow_destroy => true
validates :shop_id, :presence => true
validates :product_id, :presence => true
validates :quantity, :presence => true, :numericality => true
validates :price, :presence => true, :numericality => true

end
