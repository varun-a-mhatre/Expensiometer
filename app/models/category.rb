class Category < ActiveRecord::Base

has_attached_file :category_img, :styles => { :small => "200x200", :thumb => "35x35" }
validates :name, :presence => true
validates :category_img, :presence => true
has_many :products


end
