class Content < ApplicationRecord
  # 住所を緯度経度に変換する。
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum review: { "1": 1 ,"2": 2 ,"3": 3 ,"4": 4 ,"5": 5 }

  belongs_to :genre
  belongs_to :user

  attachment :content_image
end
