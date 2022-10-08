class Place < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :city, :area, :price, :description, :address, presence: true
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_places,
  against: [ :city, :area ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
