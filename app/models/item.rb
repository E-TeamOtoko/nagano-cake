class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :customers, through: :cart_items
  has_one_attached :image

  enum sales_status_method: {sale: 1,stop_sale: 2}
end
