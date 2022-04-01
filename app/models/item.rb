class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, :name, :explan, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}, format: /\A[0-9]+\z/
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category  
end
