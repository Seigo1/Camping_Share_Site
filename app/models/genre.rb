class Genre < ApplicationRecord
  has_many :contents, dependent: :destroy
end
