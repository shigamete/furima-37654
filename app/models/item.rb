class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, :name, :explan, presence: true
  validates :category_id, :status_id, :shippingfee_payer_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: /\A[0-9]+\z/

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee_payer
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :purchase
end
