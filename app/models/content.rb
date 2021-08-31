class Content < ApplicationRecord
  # 住所を緯度経度に変換する。
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum review: { "1": 1 ,"2": 2 ,"3": 3 ,"4": 4 ,"5": 5 }

  validates :name, presence: true
  validates :address, presence: true

  belongs_to :genre
  belongs_to :user
  # いいね機能のアソシエーション
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # ブックマーク機能のアソシエーション
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  attachment :content_image

  def favorited_by?(current_user)
    favorites.where(user_id: current_user.id).exists?
  end

  def bookmarked_by?(current_user)
    bookmarks.where(user_id: current_user.id).exists?
  end
end
