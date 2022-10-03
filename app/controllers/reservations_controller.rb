class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:reservation_id])
  end

  def new
    @place = place_params
    @reservation = Reservation.new
  end

  def create
    @place = place_params
    @reservation = Reservation.new(reservation_params)
    @reservation.status = "not avaible"
    @reservation.place_id = @place.id
    @reservation.user_id = current_user.id
    if @reservation.date_finish - @reservation.date_start == 0
      @reservation.total_price = @place.price
    else
      @reservation.total_price = (@reservation.date_finish - @reservation.date_start) * @place.price
    end
    if @reservation.save
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    Place.find(params[:place_id])
  end

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
