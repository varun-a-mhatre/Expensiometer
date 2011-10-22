class JavascriptsController < ApplicationController

def dynamic_products
	@products = Product.find(:all)
end

end
