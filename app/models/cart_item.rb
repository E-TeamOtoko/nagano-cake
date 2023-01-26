class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
 
  has_one_attached :image
end
