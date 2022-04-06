class ShippingAddress < ApplicationRecord
  validates :post_code, :prefecture_id, :municipalitie, :address, :phone_number, :purchase, presence: true
  
  belongs_to :purchase
end

