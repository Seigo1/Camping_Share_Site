class Genre < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :genre, presence: true, uniqueness: true
end
