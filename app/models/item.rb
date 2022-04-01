class Item < ApplicationRecord
  validates :name,   presence: true
  validates :explan, presence: true
  validates :price,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  
  belongs_to :user
end
