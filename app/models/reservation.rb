class Reservation < ApplicationRecord
  belongs_to :place
  belongs_to :user
  validate :reservation_date_cannot_be_in_the_past

  def reservation_date_cannot_be_in_the_past
    if date_start.present? && date_finish < Date.today
      errors.add(:date_finish, "can't be in the past")
    end
  end
end
