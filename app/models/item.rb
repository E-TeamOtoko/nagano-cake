class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :customers, through: :cart_items
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :genre_id, presence: true
  validates :item_introduction, presence: true
  validates :tax_excluded_price, presence: true

  enum sales_status_method: {sale: true, stop_sale: false}
end
