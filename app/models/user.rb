class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
  validates :lastname_full,  presence: true,
                             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :firstname_full, presence: true,
                             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :lastname_kana,  presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  validates :firstname_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  validates :birthday,       presence: true

  has_many :items
  has_many :purchases
end
