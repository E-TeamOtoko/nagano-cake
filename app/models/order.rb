class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_lists, dependent: :destroy
  
  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4}
  
  after_update do
      if self.status == "入金確認"
        self.order_lists.each {|order_list|
        order_list.update(production_status: "製作待ち")
        }
      end
    end  
end
