class Present < ActiveRecord::Base


belongs_to :item
attr_protected :item_id



end
