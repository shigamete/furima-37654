class Item < ApplicationRecord
  validates :image,  presence: true
  validates :name,   presence: true
  validates :explan, presence: true
  validates :price,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}, format: /\A[0-9]+\z/
  
  belongs_to :user
  has_one_attached :image
end
