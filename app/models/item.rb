class Item < ApplicationRecord
  has_one_attached :image

  enum sales_status: {販売中: 1,販売停止中: 2}
end
