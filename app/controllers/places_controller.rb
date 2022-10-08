class PlacesController < ApplicationController
  before_action :set_place, only: %w[show edit update destroy]

  def index
    if params[:query].present?
      sql_query = "city ILIKE :query"
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end


  def edit
  end

  def update
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    @place.destroy
    redirect_to root_path
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:city, :area, :price, :description, :address, photos: [])
  end
end
