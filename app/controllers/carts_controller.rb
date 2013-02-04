class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def destroy
	@cart = Cart.find(params[:id])
	@cart.destroy
	session[:cart_id] = nil
	respond_to do |format|
		format.html { redirect_to(root_url,
		:notice => 'Your cart is currently empty' ) }
		format.xml { head :ok }
    end
  end

end
