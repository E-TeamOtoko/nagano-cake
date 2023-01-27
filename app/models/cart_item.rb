class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
 
  has_one_attached :image
  
  def item_price
    (item.price.to_i * 1.1).floor
  end

  def sub_price
    self.item_price * self.quantity
  end

  def invoice
    CartItem.invoice
  end
end
