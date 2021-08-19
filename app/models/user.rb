class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :genres, through: :contents, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :contacts, dependent: :destroy

  enum is_active: { 有効: true, 無効: false }

  def active_for_authentication?
    super && (self.is_active == "有効")
  end
end
