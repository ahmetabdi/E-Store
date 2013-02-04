class Cart < ActiveRecord::Base
  attr_accessible :token

  has_many :cart_items, :dependent => :destroy
  has_many :products, :through => :cart_items
  
  def total_price
    cart_items.to_a.sum(&:full_price)
  end

  def add_product(product_id)
	current_item = cart_items.where(:product_id => product_id).first
	if current_item
		current_item.quantity += 1
	else
		current_item = CartItem.new(:product_id=>product_id)
		cart_items << current_item
	end
	current_item
  end

end
