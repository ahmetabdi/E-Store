class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :category_id, :image, :image_cache
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :cart_items
  has_many :orders, :through => :card_items

  default_scope :order => 'name'

  before_destroy :ensure_not_referenced_by_any_line_item
  # ensure that there are no cart items referencing this product
  def ensure_not_referenced_by_any_line_item
    if cart_items.count.zero?
	  return true
	else
	  errors[:base] << "Cart Items present"
	  return false
	end
  end



end

