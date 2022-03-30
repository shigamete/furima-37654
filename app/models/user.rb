class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,       presence: true
  validates :lastname_full,  presence: true
  validates :firstname_full, presence: true
  validates :lastname_kana,  presence: true
  validates :firstname_kana, presence: true
  validates :birthday,       presence: true
end
