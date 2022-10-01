class Place < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :city, :area, :price, :address, presence: true
end
