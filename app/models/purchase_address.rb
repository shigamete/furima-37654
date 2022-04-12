class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalitie, :address, :building_name, :phone_number,
                :purchase_id, :token

  with_options presence: true do
    validates :municipalitie, :address, :user_id, :item_id, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を入力してください' }
    validates :phone_number, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalitie: municipalitie, address: address,
                           building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
