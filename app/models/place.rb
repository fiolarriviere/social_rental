class Place < ApplicationRecord
  belongs_to :user
  validates :city, :area, :price, :address, presence: true

  has_many_attached :photos
end
