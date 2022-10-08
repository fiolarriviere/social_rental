class Place < ApplicationRecord
  belongs_to :user
  validates :city, :area, :price, :address, presence: true
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
end
