class ReservationsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reservations = Reservation.all
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :date_start,
      :date_finish,
      :status,
      :start_time,
      :finish_time,
      :place_id,
      :user_id
    )
  end
end
