class SearchController < ApplicationController

	def index
		unless (params[:search] rescue nil).nil?
			@products = Product.find(:all, :conditions => ["products.name LIKE ?", "%#{params[:search]}%"] )
		end
		if @products.empty? || @products.nil?
			redirect_to :back
			flash[:error] = "No search results could be found."
		end
	end

end
