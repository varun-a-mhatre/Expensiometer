class Product < ActiveRecord::Base

has_attached_file :product_img, :styles => { :small => "200x200", :thumb => "35x35" }
belongs_to :category
has_many :items
validates :name, :presence => true
validates :category_id, :presence => true
validates :product_img, :presence => true




end
