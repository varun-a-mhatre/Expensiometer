class Shop < ActiveRecord::Base

has_attached_file :shop_img, :styles => { :small => "200x200", :thumb => "35x35" }
has_many :items
validates :name, :presence => true
validates :shop_img, :presence => true

end
