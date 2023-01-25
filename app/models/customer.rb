class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
   validates :last_name
   validates :first_name
   validates :last_name_kana
   validates :first_name_kana
   validates :email
   validates :postal_code
   validates :address
   validates :phone_number
 end
 
 has_many :addresses, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 has_many :items, through: :cart_items
 
end
