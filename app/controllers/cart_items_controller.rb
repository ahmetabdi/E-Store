class CartItemsController < ApplicationController
  def create
	@cart = current_cart
	product = Product.find(params[:product_id])
	@cart_item = @cart.add_product(product.id)
	session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
	respond_to do |format|
		if @cart_item.save
			format.html { redirect_to(@cart_item.cart,
			:notice => 'Added to cart.' ) }
			format.xml { render :xml => @cart_item,
			:status => :created, :location => @cart_item }
		else
			format.html { render :action => "new" }
			format.xml { render :xml => @cart_item.errors,
			:status => :unprocessable_entity }
		end
	end
  end
end
