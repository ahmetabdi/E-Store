class Order < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  attr_accessible :address, :email, :name, :pay_type, :status
  PAYMENT_TYPES = [ "Check", "Credit Card", "Paypal"]
  STATUS_TYPES = [ "Processing", "Processed", "Rejected"]

  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end

  def total_price
    cart_items.to_a.sum(&:full_price)
  end

end
