class OrderList < ApplicationRecord
    
  belongs_to :order
  belongs_to :item
  
  enum production_status: {着手不可:0,製作待ち:1,製作中:2,製作完了:3}
  
  after_update do
    order_lists = self.order.order_lists
    if order_lists.any? {|order_list| order_list.production_status == "製作中"} == true
      self.order.update(status: "製作中") 
    elsif order_lists.all? {|order_list| order_list.production_status == "製作完了"} == true 
      self.order.update(status: "発送準備中") 
    end
  end
  
end


