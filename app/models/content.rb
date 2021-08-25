class Content < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum review: { "1": 0 ,"2": 1 ,"3": 2 ,"4": 3 ,"5": 4 }

  belongs_to :genre
  belongs_to :user
  
  attachment :image
end
