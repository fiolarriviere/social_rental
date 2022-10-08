class Place < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :city, :area, :price, :address, presence: true
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_places,
  against: [ :city, :area ],
  using: {
    tsearch: { prefix: true }
  }
end
