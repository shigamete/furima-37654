class ShippingAddress < ApplicationRecord
  # validates :municipalitie, :address, :phone_number, presence: true
  # validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  belongs_to :purchase
end

